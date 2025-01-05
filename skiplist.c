#include <stdio.h>
#include <stdlib.h> 

typedef struct skiplist_node
{
    int value;
    struct skiplist_node* next;
    struct skiplist_node* prev;
} skiplist_node_t;

#define N_BLOCKS 1024
#define N_ACCESS_POINTS 4

#define PREFETCH 0



int main(int argc, char* argv[])
{
    FILE* file;
    char line[1024];
    int intermediate_ptr = 0;

    skiplist_node_t* head = NULL;
    skiplist_node_t* node_ptrs[N_BLOCKS];


    int pos = 0; // active access point index
    skiplist_node_t access_points[N_ACCESS_POINTS];

    // quick sanity check
    if (argc < 3)
    {
        fprintf(stderr, "usage: %s [filename0] [filename1] ... [filenamen]\n", argv[0]);
        return 1;
    }

    // populate the skiplist
    head = (skiplist_node_t*)malloc(sizeof(skiplist_node_t));

    if (head == NULL)
    {
        perror("error allocating memory");
        return 1;
    }

    for (int i = 0; i < N_BLOCKS; i++)
    {
        node_ptrs[i] = (skiplist_node_t*)malloc(sizeof(skiplist_node_t));
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
    skiplist_node_t* prev = head;

    while (fgets(line, sizeof(line), file))
    {
        int start, len, pos, allocation;

        skiplist_node_t* c = NULL;

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
    skiplist_node_t* current = head->next;
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