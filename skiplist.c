#include <stdio.h>
#include <stdlib.h> 

#include "common.c"

typedef struct skiplist_node
{
    int value;
    int access_point_index; // the index of the access point that this node belongs to
    struct skiplist_node* next;
    struct skiplist_node* prev;
} skiplist_node_t;

#define N_ACCESS_POINTS 4

int NBLOCKS = 0;
int NFREE = 0;

int SEGMENT_LEN = 0;

FILE* file;
char line[1024];
int intermediate_ptr = 0;

skiplist_node_t* head = NULL;
skiplist_node_t* list = NULL;

int pos = 0; // active access point index
skiplist_node_t access_points[N_ACCESS_POINTS];

inline void increment_pos()
{
    pos = (pos + 1) % N_ACCESS_POINTS;
}

inline void decrement_pos()
{
    pos = (pos - 1 + N_ACCESS_POINTS) % N_ACCESS_POINTS;
}

void skiplist_delete_single()
{
    skiplist_node_t* deleted = access_points[pos].next;
    DELETE_NODE(deleted);
    increment_pos();
}

void skiplist_insert_single(skiplist_node_t* node)
{
    decrement_pos();
    skiplist_node_t* insert_before = access_points[pos].next;
    INSERT_NODE_BEFORE(insert_before, node);
    node->access_point_index = pos;
}

void skiplist_delete_by_reference(skiplist_node_t* node)
{
    if (node->access_point_index == pos)
    {
        DELETE_NODE(node);
        increment_pos();
    }
    else
    {
        // node that we are going to move to rebalance access points
        skiplist_node_t* rebalancing_node = access_points[pos].next;
        // remove rebalancing node from rebalancing access point so its dangling
        DELETE_NODE(rebalancing_node);

        // implicit removal of node from its access point
        skiplist_node_t* next = node->next;
        rebalancing_node->prev = &access_points[node->access_point_index];
        access_points[node->access_point_index].next = rebalancing_node;
        rebalancing_node->next = next;
        next->prev = rebalancing_node;

        increment_pos();
    }
}

int main(int argc, char* argv[])
{
    // quick sanity check
    if (argc < 3)
    {
        fprintf(stderr, "usage: %s [filename0] [filename1] ... [filenamen]\n", argv[0]);
        return 1;
    }

    // open file with allocation map
    file = fopen(argv[1], "r");
    if (file == NULL)
    {
        perror("err: opening allocation map");
        return 1;
    }

    // populate the linked list
    head = (skiplist_node_t*)malloc(sizeof(skiplist_node_t));

    if (head == NULL)
    {
        perror("err: allocating memory for head");
        return 1;
    }


    if (fgets(line, sizeof(line), file) != NULL)
    {
        NBLOCKS = atoi(line);
    }

    if (fgets(line, sizeof(line), file) != NULL)
    {
        NFREE = atoi(line);
    }

    list = (skiplist_node_t*)malloc(NBLOCKS * sizeof(skiplist_node_t));

    if (list == NULL)
    {
        perror("err: allocating memory for list");
        return 1;
    }

    // populate the linked list
    int v = 0;
    skiplist_node_t* prev = head;
    while (fgets(line, sizeof(line), file))
    {
        int free = atoi(line);
        if (free)
        {
            skiplist_node_t* node = &list[v];
            node->value = v;
            prev->next = node;
            node->prev = prev;
            v++;
            prev = node;
        }
    }

    // link last node to head
    prev->next = head;
    head->prev = prev;

    fclose(file);

    // check if the linked list is correctly populated
    skiplist_node_t* current = head->next;
    int value = 0;
    while (current != head)
    {
        printf("current: %d\n", current->value);
        if (current->value != value)
        {
            perror("err: populating linked list\n");
            return 1;
        }
        current = current->next;
        value++;
    }

    printf("%d blocks free\n", v);

    // initialize access points
    SEGMENT_LEN = NFREE / N_ACCESS_POINTS;
    current = head->next;
    for (int i = 0; i < N_ACCESS_POINTS; i++)
    {
        access_points[i].next = current;
        access_points[i].prev = current->prev;
        access_points[i].value = current->value;

        for (int j = 0; j < SEGMENT_LEN; j++)
        {
            current->access_point_index = i;
            current = current->next;
        }
    }

    for (int i = 0; i < N_ACCESS_POINTS; i++)
    {
        printf("access point %d: %d\n", i, access_points[i].value);
    }

    // open file with requests
    file = fopen(argv[2], "r");
    if (file == NULL)
    {
        perror("error opening file");
        return 1;
    }

    while (fgets(line, sizeof(line), file))
    {
        int values_read;
        int request_size = 0;
        char request_type = 0;

        values_read = sscanf(line, "%c %d", &request_type, &request_size);

        // allocate so remove from free list
        if (request_type == 'a')
        {

        }
        // free so add to free list
        else if (request_type == 'f')
        {

        }
        // d so remove by reference
        else if (request_type == 'd')
        {

        }
    }

    fclose(file);

    return 0;
}