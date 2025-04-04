#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct node
{
    int key;
    struct node* next;
} node_t;


typedef struct hash_table
{
    node_t** buckets;
    size_t num_buckets;
} hash_table_t;


typedef struct task
{
    node_t* current;
    int key;
} task_t;

#define MAX_TASKS 60

task_t tasks[MAX_TASKS];

hash_table_t* build_hash_table(int* keys, size_t key_count, size_t num_buckets)
{
    hash_table_t* hash_table = malloc(sizeof(hash_table_t));
    hash_table->num_buckets = num_buckets;
    hash_table->buckets = calloc(num_buckets, sizeof(node_t*));

    for (size_t i = 0; i < key_count; i++)
    {
        int key = keys[i];
        size_t bucket_index = key % num_buckets;

        node_t* new_node = malloc(sizeof(node_t));
        new_node->key = key;
        new_node->next = hash_table->buckets[bucket_index];
        hash_table->buckets[bucket_index] = new_node;
    }

    return hash_table;
}


void free_hash_table(hash_table_t* hash_table)
{
    for (size_t i = 0; i < hash_table->num_buckets; i++)
    {
        node_t* node = hash_table->buckets[i];
        while (node)
        {
            node_t* temp = node;
            node = node->next;
            free(temp);
        }
    }
    free(hash_table->buckets);
    free(hash_table);
}


int* read_keys_from_file(const char* filename, size_t* key_count)
{
    FILE* file = fopen(filename, "r");
    if (!file)
    {
        fprintf(stderr, "error opening file: %s\n", filename);
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

int naive_hash_table_search(hash_table_t* hash_table, int key)
{
    size_t bucket_index = key % hash_table->num_buckets;
    node_t* node = hash_table->buckets[bucket_index];
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

        size_t num_buckets = 1000000; // 1 million buckets
        hash_table_t* hash_table = build_hash_table(keys, key_count, num_buckets);

        for (int n_workers = 1; n_workers <= MAX_TASKS; n_workers++)
        {
            int total_ops = 0;

            int key_index = 0;
            for (int i = 0; i < n_workers; i++)
            {
                tasks[i].key = keys[key_index % key_count];
                int bucket_index = tasks[i].key % hash_table->num_buckets;
                tasks[i].current = hash_table->buckets[bucket_index];
                key_index++;
            }

            int cr = n_workers;

            clock_t start_time = clock();

            while (cr != 0)
            {
                // speculative execution will jump to next task to avoid waiting for data
                for (int i = 0; i < n_workers; i++)
                {
                    if (tasks[i].key != -1)
                    {
                        if (tasks[i].key == tasks[i].current->key)
                        {
                            total_ops++;
                            if (key_index < key_count)
                            {
                                tasks[i].key = keys[key_index % key_count];
                                int bucket_index = tasks[i].key % hash_table->num_buckets;
                                tasks[i].current = hash_table->buckets[bucket_index];
                                key_index++;
                            }
                            else
                            {
                                cr--;
                                tasks[i].key = -1;
                            }
                        }
                        else
                        {
                            tasks[i].current = tasks[i].current->next;
                        }
                    }
                }
            }

            clock_t end_time = clock();
            double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
            double mops = total_ops / (elapsed_time * 1e6);
            printf("file: %s, total ops with %d tasks: %d, MOPS: %f\n", filenames[file_idx], n_workers, total_ops, mops);
        }

        // naive hash table search
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
        printf("file: %s, naive hash table search MOPS: %f\n", filenames[file_idx], naive_mops);

        free(keys);
        free_hash_table(hash_table);
    }

    return 0;
}