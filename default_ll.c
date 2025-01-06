#include <stdio.h>
#include <stdlib.h> 

#include "common.c"

typedef struct ll_node
{
    int value;
    struct ll_node* next;
    struct ll_node* prev;
} ll_node_t;

int NBLOCKS = 0;
int NFREE = 0;

FILE* file;
char line[1024];
int intermediate_ptr = 0;

ll_node_t* head = NULL;
ll_node_t* list = NULL;


void ll_delete_after_head()
{
    if (head->next == head)
    {
        // empty list
        // treat as critical error
        perror("err: ll_delete_after_head - empty list");
        exit(1);
    }
    DELETE_NODE(head->next);
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
    head = (ll_node_t*)malloc(sizeof(ll_node_t));

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

    list = (ll_node_t*)malloc(NBLOCKS * sizeof(ll_node_t));

    if (list == NULL)
    {
        perror("err: allocating memory for list");
        return 1;
    }

    // populate the linked list
    int i = 0;
    ll_node_t* prev = head;
    while (fgets(line, sizeof(line), file))
    {
        int free = atoi(line);
        if (free)
        {
            ll_node_t* node = &list[i];
            node->value = i;
            prev->next = node;
            node->prev = prev;
            i++;
            prev = node;
        }
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
        printf("current: %d\n", current->value);
        if (current->value != value)
        {
            perror("err: populating linked list\n");
            return 1;
        }
        current = current->next;
        value++;
    }

    printf("%d blocks free\n", i);

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