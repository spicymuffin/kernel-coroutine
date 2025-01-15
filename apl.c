#include <stdio.h>
#include <stdlib.h> 
#include <time.h>
#include <immintrin.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>

#include "common.c"

typedef struct apl_node
{
    int padding[6]; // 6 * 4 = 24 byte
    int value; // 4 byte
    int access_point_index; // the index of the access point that this node belongs to // 4 byte
    struct apl_node* next; // 8 byte
    struct apl_node* prev; // 8 byte
} apl_node_t;

#define AMAC 1
#define APL_DEBUG_METRICS 1
#define N_ACCESS_POINTS 16

int ONLY_BENCHMARK = 0;

int N_BLOCKS = 0;
int N_FREE = 0;

int SEGMENT_LEN = 0;

FILE* file;

#define PERF_CTL 1

#if PERF_CTL
const char* ctl_fifo = "/tmp/perf_ctl_pipe";
const char* ack_fifo = "/tmp/perf_ack_pipe";

int ctl_pipe;
int ack_pipe;
#endif

char line[1024];

apl_node_t* head = NULL;
apl_node_t* list = NULL;

int pos = 0; // active access point index
apl_node_t access_points[N_ACCESS_POINTS];

#if AMAC

#define PREFETCH 1

#if PREFETCH
#define BUILTIN_PREFETCH 1
#define IMMINTRIN_PREFETCH 0
#endif

#define N_AMAC_WORKERS N_ACCESS_POINTS

typedef struct amac_worker_state
{
    apl_node_t* node;
    int stage;
} amac_worker_state_t;

amac_worker_state_t workers[N_AMAC_WORKERS];
int worker_ptr = -1;

#endif

#if APL_DEBUG_METRICS
int access_point_counts[N_ACCESS_POINTS];
#endif

static inline void increment_pos()
{
    pos = (pos + 1) % N_ACCESS_POINTS;
}

static inline void decrement_pos()
{
    pos = (pos - 1 + N_ACCESS_POINTS) % N_ACCESS_POINTS;
}

void apl_delete_single()
{
    apl_node_t* to_delete = access_points[pos].next;

    DELETE_NODE(to_delete);

    // printf("deleting node no. %d\n", to_delete->value);
    // printf("deleted node has index: %ld\n", to_delete - list);

    #if APL_DEBUG_METRICS
    access_point_counts[pos]--;
    #endif

    increment_pos();
}

void apl_insert_single(apl_node_t* node)
{
    decrement_pos();
    apl_node_t* insert_before = access_points[pos].next;
    INSERT_NODE_BEFORE(insert_before, node);
    node->access_point_index = pos;

    #if APL_DEBUG_METRICS
    access_point_counts[pos]++;
    #endif
}

void apl_delete_by_reference(apl_node_t* node)
{
    #if APL_DEBUG_METRICS
    access_point_counts[pos]--;
    #endif

    if (node->access_point_index == pos)
    {
        DELETE_NODE(node);
        increment_pos();
    }
    else
    {
        // node that we are going to move to rebalance access points
        apl_node_t* rebalancing_node = access_points[pos].next;
        // remove rebalancing node from rebalancing access point so its dangling
        DELETE_NODE(rebalancing_node);

        // implicit removal of node from its access point
        // the node is not in the list anymore, but it still has references to the nodes
        // it was previously linked to
        apl_node_t* next = node->next;

        // fix left link
        rebalancing_node->prev = &access_points[node->access_point_index];
        access_points[node->access_point_index].next = rebalancing_node;

        // fix right link
        rebalancing_node->next = next;
        next->prev = rebalancing_node;

        rebalancing_node->access_point_index = node->access_point_index;

        increment_pos();
    }
}

int main(int argc, char* argv[])
{
    // quick sanity check
    if (argc < 3)
    {
        fprintf(stderr, "usage: %s alloc_map requests bm l1overwrite\n", argv[0]);
        return 1;
    }

    if (argc > 3)
    {
        ONLY_BENCHMARK = atoi(argv[3]);
    }

    #if PERF_CTL
    ctl_pipe = open(ctl_fifo, O_WRONLY);
    ack_pipe = open(ack_fifo, O_RDONLY);
    #endif

    if (!ONLY_BENCHMARK)
    {
        printf("apl_node_t size: %lu\n", sizeof(apl_node_t));
    }

    // open file with allocation map
    file = fopen(argv[1], "r");
    if (file == NULL)
    {
        perror("err: opening allocation map");
        return 1;
    }

    // populate the linked list
    head = (apl_node_t*)malloc(sizeof(apl_node_t));

    if (head == NULL)
    {
        perror("err: allocating memory for head");
        return 1;
    }


    if (fgets(line, sizeof(line), file) != NULL)
    {
        N_BLOCKS = atoi(line);
    }

    if (fgets(line, sizeof(line), file) != NULL)
    {
        N_FREE = atoi(line);
    }

    list = (apl_node_t*)malloc(N_BLOCKS * sizeof(apl_node_t));

    if (list == NULL)
    {
        perror("err: allocating memory for list");
        return 1;
    }

    int blocks_free = 0;
    // populate the linked list
    apl_node_t* prev = head;
    while (fgets(line, sizeof(line), file))
    {
        int block_idx = atoi(line);
        apl_node_t* node = &list[block_idx];
        node->value = blocks_free;
        prev->next = node;
        node->prev = prev;
        prev = node;
        blocks_free++;
    }

    // link last node to head
    prev->next = head;
    head->prev = prev;

    fclose(file);

    // check if the linked list is correctly populated
    apl_node_t* current = head->next;
    int value = 0;
    while (current != head)
    {
        // printf("current: %d\n", current->value);
        if (current->value != value)
        {
            perror("err: populating linked list\n");
            return 1;
        }
        // printf("slot: %ld\n", current - list);
        current = current->next;
        value++;
    }

    if (!ONLY_BENCHMARK)
    {
        printf("%d blocks free\n", blocks_free);
    }

    // initialize access points
    SEGMENT_LEN = N_FREE / N_ACCESS_POINTS;
    current = head->next;
    for (int i = 0; i < N_ACCESS_POINTS; i++)
    {
        INSERT_NODE_BEFORE(current, &access_points[i]);
        access_points[i].value = current->value;

        for (int j = 0; j < SEGMENT_LEN; j++)
        {
            current->access_point_index = i;
            current = current->next;
            #if APL_DEBUG_METRICS
            access_point_counts[i]++;
            #endif
        }
    }

    for (int i = 0; i < N_ACCESS_POINTS; i++)
    {
        if (!ONLY_BENCHMARK)
        {
            printf("access point %d start page idx: %d\n", i, access_points[i].value);
        }
    }

    for (int i = 0; i < N_ACCESS_POINTS; i++)
    {
        if (!ONLY_BENCHMARK)
        {
            #if APL_DEBUG_METRICS
            printf("access point %d count: %d\n", i, access_point_counts[i]);
            #endif
        }
    }

    // open file with requests
    file = fopen(argv[2], "r");
    if (file == NULL)
    {
        perror("err: opening file");
        return 1;
    }

    if (!ONLY_BENCHMARK)
    {
        printf("flushing cache\n");
    }
    overwrite_x_kb_l1(L1_CACHE_SIZE_KB);

    if (!ONLY_BENCHMARK)
    {
        printf("starting benchmark\n");
    }

    int n_requests = 0;

    #if PERF_CTL
    char ack_buf[5];
    memset(ack_buf, 0, 5);
    write(ctl_pipe, "enable\n", 7);
    read(ack_pipe, ack_buf, 4);
    #endif

    // start timer
    clock_t benchmark_start_ts = clock();

    while (fgets(line, sizeof(line), file))
    {
        int values_read;
        int request_arg = 0;
        char request_type = 0;

        values_read = sscanf(line, "%c %d", &request_type, &request_arg);
        (void)values_read; // suppress warning

        // allocate so remove from free list
        if (request_type == 'a')
        {
            #if AMAC

            int num_finished = 0;

            while (num_finished < request_arg)
            {
                worker_ptr = (worker_ptr + 1) % N_AMAC_WORKERS;
                amac_worker_state_t* worker = &workers[worker_ptr];

                if (worker->stage == 0)
                {
                    worker->stage = 1;

                    #if PREFETCH
                    #if BUILTIN_PREFETCH
                    __builtin_prefetch(access_points[worker_ptr].next, 0, 3);
                    #elif IMMINTRIN_PREFETCH
                    _mm_prefetch((const char*)access_points[worker_ptr].next, _MM_HINT_T0);
                    #endif
                    #endif
                }
                else if (worker->stage == 1)
                {
                    worker->node = access_points[worker_ptr].next;
                    worker->stage = 2;

                    #if PREFETCH
                    #if BUILTIN_PREFETCH
                    // prefetch next for fast delete
                    __builtin_prefetch(worker->node->next, 0, 3);
                    #elif IMMINTRIN_PREFETCH
                    _mm_prefetch((const char*)worker->node->next, _MM_HINT_T0);
                    #endif
                    #endif
                }
                else if (worker->stage == 2)
                {
                    // printf("deleteing node no. %d\n", (list + access_points[pos].next->value) - access_points);
                    apl_delete_single();

                    // if there are more requests than workers, we know that this worker will
                    // be used again so we prefetch the next access point
                    if (request_arg - num_finished >= N_AMAC_WORKERS)
                    {
                        // after delete, the node after the deleted node
                        // is already prefetched so we can just access it directly with no penalty
                        worker->node = access_points[worker_ptr].next;
                        
                        #if PREFETCH
                        #if BUILTIN_PREFETCH
                        __builtin_prefetch(worker->node->next, 0, 3);
                        #elif IMMINTRIN_PREFETCH
                        _mm_prefetch((const char*)worker->node->next, _MM_HINT_T0);
                        #endif
                        #endif
                    }
                    else
                    {
                        // exit stage
                        worker->stage = 3;
                    }

                    num_finished++;
                    n_requests++;
                }

                // printf("num_finished: %d\n", num_finished);
            }

            for (int i = 0; i < N_AMAC_WORKERS; i++)
            {
                workers[i].stage = 0;
            }

            #else

            for (int i = 0; i < request_arg; i++)
            {
                apl_delete_single();
                n_requests++;
            }

            #endif
            // overwrite_x_kb_l1(48);
        }
        // free so add to free list
        else if (request_type == 'f')
        {
            #if AMAC
            apl_insert_single(&list[request_arg]);
            n_requests++;
            #else
            apl_insert_single(&list[request_arg]);
            n_requests++;
            #endif
        }
        // d so remove by reference
        else if (request_type == 'd')
        {
            #if AMAC
            apl_delete_by_reference(&list[request_arg]);
            n_requests++;
            #else
            apl_delete_by_reference(&list[request_arg]);
            n_requests++;
            #endif
        }
    }

    clock_t benchmark_end_ts = clock();

    #if PERF_CTL
    memset(ack_buf, 0, 5);
    write(ctl_pipe, "disable\n", 8);
    read(ack_pipe, ack_buf, 4);

    close(ctl_pipe);
    close(ack_pipe);
    #endif

    if (!ONLY_BENCHMARK)
    {
        printf("debug metrics:\n");
    }

    #if APL_DEBUG_METRICS
    if (!ONLY_BENCHMARK)
    {
        for (int i = 0; i < N_ACCESS_POINTS; i++)
        {
            printf("    access point %d count: %d\n", i, access_point_counts[i]);
        }
    }
    #endif

    if (!ONLY_BENCHMARK)
    {
        printf("benchmark time: %f\n", (double)(benchmark_end_ts - benchmark_start_ts) / CLOCKS_PER_SEC);
        printf("benchmark requests: %d\n", n_requests);
        printf("benchmark requests per second: %f\n", (double)n_requests / ((double)(benchmark_end_ts - benchmark_start_ts) / CLOCKS_PER_SEC) / 1000000.0f);
    }
    else
    {
        printf("%d\n", N_BLOCKS);
        printf("%f\n", (double)(benchmark_end_ts - benchmark_start_ts) / CLOCKS_PER_SEC);
        printf("%d\n", n_requests);
        printf("%f\n", (double)n_requests / ((double)(benchmark_end_ts - benchmark_start_ts) / CLOCKS_PER_SEC) / 1000000.0f);
    }
    fclose(file);

    // check that the freelist is empty
    if (!ONLY_BENCHMARK)
    {
        printf("empty: %d\n", access_points[N_ACCESS_POINTS - 1].next == head);
    }

    // count the number of nodes in the list
    int count = 0;
    current = head->next;
    while (current != head)
    {
        count++;
        current = current->next;
    }

    if (!ONLY_BENCHMARK)
    {
        printf("count: %d\n", count);
    }

    return 0;
}
