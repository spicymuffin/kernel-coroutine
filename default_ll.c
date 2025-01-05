#include <stdio.h>
#include <stdlib.h> 

typedef struct ll_node
{
    int value;
    struct ll_node* next;
    struct ll_node* prev;
} ll_node_t;

#define N_BLOCKS 1024
#define N_ACCESS_POINTS 4

FILE* file;
char line[1024];
int intermediate_ptr = 0;

ll_node_t* head = NULL;
ll_node_t* node_ptrs[N_BLOCKS];

// delete node (unsafe - does not check if node is head)
inline void delete_node(ll_node_t* node)
{
    ll_node_t* prev = node->prev;
    ll_node_t* next = node->next;

    prev->next = next;
    next->prev = prev;

    free(node);
}

// insert node after insert_after
inline void insert_node(ll_node_t* insert_after, ll_node_t* node)
{
    ll_node_t* next = insert_after->next;

    insert_after->next = node;
    node->prev = insert_after;

    node->next = next;
    next->prev = node;
}

void ll_delete_after_head()
{
    if (head->next == head)
    {
        // empty list
        // treat as critical error
        perror("ll_delete_after_head: empty list");
        exit(1);
    }
    delete_node(head->next);
}

void ll_insert_after_head(ll_node_t* node)
{
    insert_node(head, node);
}

void ll_delete_by_reference(ll_node_t* node)
{
    delete_node(node);
}


int main(int argc, char* argv[])
{


    // quick sanity check
    if (argc < 3)
    {
        fprintf(stderr, "usage: %s [filename0] [filename1] ... [filenamen]\n", argv[0]);
        return 1;
    }

    // populate the skiplist
    head = (ll_node_t*)malloc(sizeof(ll_node_t));

    if (head == NULL)
    {
        perror("error allocating memory");
        return 1;
    }

    for (int i = 0; i < N_BLOCKS; i++)
    {
        node_ptrs[i] = (ll_node_t*)malloc(sizeof(ll_node_t));
        if (node_ptrs[i] == NULL)
        {
            perror("error allocating memory");
            return 1;
        }
    }

    // open file with allocation map
    file = fopen(argv[1], "r");
    if (file == NULL)
    {
        perror("error opening file");
        return 1;
    }

    int i = 0;
    ll_node_t* prev = head;

    while (fgets(line, sizeof(line), file))
    {
        int start, len, pos, allocation;

        ll_node_t* c = NULL;

        allocation = sscanf(line, "%d %d %d", &start, &len, &pos);
        if (allocation != 3)
        {
            fprintf(stderr, "error reading allocation map\n");
            return 1;
        }


        printf("allocating %d blocks starting at %d at %d\n", len, start, pos);
        for (int j = 0; j < len; j++)
        {
            c = node_ptrs[pos + j];
            c->value = i;

            prev->next = c;
            c->prev = prev;

            prev = c;
            i++;
        }
    }

    // link last node to head
    prev->next = head;
    head->prev = prev;

    fclose(file);

    // check if the skiplist is correctly populated
    ll_node_t* current = head->next;
    int value = 0;
    while (current != head)
    {
        printf("current: %d\n", current->value);
        if (current->value != value)
        {
            perror("error populating skiplist\n");
            return 1;
        }
        current = current->next;
        value++;
    }

    printf("allocated %d blocks\n", i);

    // place intermediate pointers
    int segment_length = N_BLOCKS / N_ACCESS_POINTS;
    printf("segment length: %d\n", segment_length);
    current = head->next;
    for (int i = 0; i < N_ACCESS_POINTS; i++)
    {
        access_points[i].next = current;
        access_points[i].value = current->value;

        for (int j = 0; j < segment_length; j++)
        {
            current = current->next;
        }
    }

    // check if the access_points pointers are correctly placed
    for (int i = 0; i < N_ACCESS_POINTS; i++)
    {
        printf("access_points[%d]: %d\n", i, access_points[i].value);
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
        int request_size = 0;
        char request_type = 0;
        scanf(line, "%c %d", &request_type, &request_size);
        #if PREFETCH
        #else
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
        #endif
    }

    fclose(file);

    return 0;
}