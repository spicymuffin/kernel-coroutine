#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef enum { START, PROCEDURE, END, DESTROYED } State;

typedef struct Node
{
    int key;
    struct Node* next;
} Node;

typedef struct
{
    Node** buckets;
    size_t num_buckets;
} HashTable;

typedef struct
{
    State state;
    Node* current;
    int key;
    HashTable* hash_table;
} CoroutineContext;

HashTable* build_hash_table(int* keys, size_t key_count, size_t num_buckets)
{
    HashTable* hash_table = malloc(sizeof(HashTable));
    hash_table->num_buckets = num_buckets;
    hash_table->buckets = calloc(num_buckets, sizeof(Node*));

    for (size_t i = 0; i < key_count; i++)
    {
        int key = keys[i];
        size_t bucket_index = key % num_buckets;

        Node* new_node = malloc(sizeof(Node));
        new_node->key = key;
        new_node->next = hash_table->buckets[bucket_index];
        hash_table->buckets[bucket_index] = new_node;
    }

    return hash_table;
}

void free_hash_table(HashTable* hash_table)
{
    for (size_t i = 0; i < hash_table->num_buckets; i++)
    {
        Node* node = hash_table->buckets[i];
        while (node)
        {
            Node* temp = node;
            node = node->next;
            free(temp);
        }
    }
    free(hash_table->buckets);
    free(hash_table);
}

void coroutine(CoroutineContext* ctx, int* total_ops)
{
    size_t bucket_index;
    switch (ctx->state)
    {
    case START:
        bucket_index = ctx->key % ctx->hash_table->num_buckets;
        ctx->current = ctx->hash_table->buckets[bucket_index];
        ctx->state = PROCEDURE;
        __builtin_prefetch(ctx->current, 0, 1);
        return;

    case PROCEDURE:
        if (ctx->current && ctx->current->key == ctx->key)
        {
            (*total_ops)++;
            ctx->state = END;
        }
        else if (ctx->current)
        {
            ctx->current = ctx->current->next;
            ctx->state = PROCEDURE;
            __builtin_prefetch(ctx->current, 0, 1);
        }
        else
        {
            ctx->state = END;
        }
        return;

    case END:
    case DESTROYED:
        return;
    }
}

int* read_keys_from_file(const char* filename, size_t* key_count)
{
    FILE* file = fopen(filename, "r");
    if (!file)
    {
        perror("Failed to open file");
        return NULL;
    }

    size_t capacity = 10;
    *key_count = 0;
    int* keys = malloc(capacity * sizeof(int));

    while (fscanf(file, "%d", &keys[*key_count]) == 1)
    {
        (*key_count)++;
        if (*key_count >= capacity)
        {
            capacity *= 2;
            keys = realloc(keys, capacity * sizeof(int));
        }
    }

    fclose(file);
    return keys;
}

int naive_hash_table_search(HashTable* hash_table, int key)
{
    size_t bucket_index = key % hash_table->num_buckets;
    Node* node = hash_table->buckets[bucket_index];
    while (node)
    {
        if (node->key == key)
        {
            return 1; // Found
        }
        node = node->next;
    }
    return 0; // Not found
}

int main()
{
    const char* filenames[] = {
        "uniform_small_keys.txt",
        "uniform_large_keys.txt",
        "zipf_small_keys.txt",
        "zipf_large_keys.txt"
    };
    const int num_files = sizeof(filenames) / sizeof(filenames[0]);

    for (int file_idx = 0; file_idx < num_files; file_idx++)
    {
        size_t key_count = 0;
        int* keys = read_keys_from_file(filenames[file_idx], &key_count);
        if (!keys)
        {
            return 1;
        }

        size_t num_buckets = 1000000;
        HashTable* hash_table = build_hash_table(keys, key_count, num_buckets);

        // Coroutine-based search
        for (int num_coroutines = 1; num_coroutines <= 30; num_coroutines++)
        {
            int total_ops = 0;
            CoroutineContext* ctxs = malloc(num_coroutines * sizeof(CoroutineContext));

            int key_index = 0;
            for (int i = 0; i < num_coroutines; i++)
            {
                ctxs[i].state = START;
                ctxs[i].current = NULL;
                ctxs[i].key = keys[key_index % key_count];
                ctxs[i].hash_table = hash_table;
                key_index++;
            }

            int not_done = num_coroutines;
            clock_t start_time = clock();

            while (not_done > 0)
            {
                for (int i = 0; i < num_coroutines; i++)
                {
                    if (ctxs[i].state != DESTROYED)
                    {
                        if (ctxs[i].state != END)
                        {
                            coroutine(&ctxs[i], &total_ops);
                        }
                        else
                        {
                            if (key_index < key_count)
                            {
                                ctxs[i].state = START;
                                ctxs[i].current = NULL;
                                ctxs[i].key = keys[key_index];
                                key_index++;
                            }
                            else
                            {
                                ctxs[i].state = DESTROYED;
                                not_done--;
                            }
                        }
                    }
                }
            }

            clock_t end_time = clock();
            double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
            double mops = total_ops / (elapsed_time * 1e6);
            printf("File: %s, Total ops with %d coroutines: %d, MOPS: %f\n", filenames[file_idx], num_coroutines, total_ops, mops);
            free(ctxs);
        }

        // Naive hash table search
        clock_t naive_start_time = clock();
        int naive_ops = 0;
        for (size_t i = 0; i < key_count; i++)
        {
            if (naive_hash_table_search(hash_table, keys[i]))
            {
                naive_ops++;
            }
        }
        clock_t naive_end_time = clock();

        double naive_elapsed_time = (double)(naive_end_time - naive_start_time) / CLOCKS_PER_SEC;
        double naive_mops = naive_ops / (naive_elapsed_time * 1e6);
        printf("File: %s, Naive hash table search MOPS: %f\n", filenames[file_idx], naive_mops);

        free(keys);
        free_hash_table(hash_table);
    }

    return 0;
}
