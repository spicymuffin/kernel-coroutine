#include <stdio.h>
#include <stdlib.h> 
#include <time.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>

#include "common.c"

typedef struct ll_node
{
    int padding[6]; // 6 * 4 = 24 byte  
    int value; // 4 byte
    struct ll_node* next; // 8 byte
    struct ll_node* prev; // 8 byte
} ll_node_t;

int ONLY_BENCHMARK = 0;

int N_BLOCKS = 0;
int N_FREE = 0;

FILE* file;

#define PERF_CTL 0

#if PERF_CTL
const char* ctl_fifo = "/tmp/perf_ctl_pipe";
const char* ack_fifo = "/tmp/perf_ack_pipe";

int ctl_pipe;
int ack_pipe;
#endif

char line[1024];
int intermediate_ptr = 0;

ll_node_t* head = NULL;
ll_node_t* list = NULL;


void ll_delete_after_head()
{
    // if (head->next == head)
    // {
    //     // empty list
    //     // treat as critical error
    //     perror("err: ll_delete_after_head - empty list");
    //     exit(1);
    // }

    ll_node_t* to_delete = head->next;

    DELETE_NODE(to_delete);

    // printf("deleting node no. %d\n", to_delete->value);
    // printf("deleted node has index: %ld\n", to_delete - list);
}

void ll_insert_after_head(ll_node_t* node)
{
    INSERT_NODE_AFTER(head, node);
}

void ll_delete_by_reference(ll_node_t* node)
{
    DELETE_NODE(node);
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
        printf("ll_node_t size: %lu\n", sizeof(ll_node_t));
    }

    // open file with allocation map
    file = fopen(argv[1], "r");
    if (file == NULL)
    {
        perror("err: opening allocation map");
        return 1;
    }

    // populate the linked list
    head = (ll_node_t*)malloc(sizeof(ll_node_t));

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

    list = (ll_node_t*)malloc(N_BLOCKS * sizeof(ll_node_t));

    if (list == NULL)
    {
        perror("err: allocating memory for list");
        return 1;
    }

    // populate the linked list
    int blocks_free = 0;
    // populate the linked list
    ll_node_t* prev = head;
    while (fgets(line, sizeof(line), file))
    {
        int block_idx = atoi(line);
        ll_node_t* node = &list[block_idx];
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
    ll_node_t* current = head->next;
    int value = 0;
    while (current != head)
    {
        // printf("current: %d\n", current->value);
        if (current->value != value)
        {
            perror("err: populating linked list\n");
            return 1;
        }
        current = current->next;
        value++;
    }

    if (!ONLY_BENCHMARK)
    {
        printf("%d blocks free\n", blocks_free);
    }

    // open file with requests
    file = fopen(argv[2], "r");
    if (file == NULL)
    {
        perror("err: opening requests");
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
        (void)values_read; // suppress unused variable warning

        // allocate so remove from free list
        if (request_type == 'a')
        {
            for (int i = 0; i < request_arg; i++)
            {
                ll_delete_after_head();
                n_requests++;
            }
        }
        // free so add to free list
        else if (request_type == 'f')
        {
            ll_insert_after_head(&list[request_arg]);
            n_requests++;
        }
        // d so remove by reference
        else if (request_type == 'd')
        {
            ll_delete_by_reference(&list[request_arg]);
            n_requests++;
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
        printf("empty: %d\n", head->next == head);
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