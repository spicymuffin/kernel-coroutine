#ifndef _COMMON_H_
#define _COMMON_H_

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define L1_CACHE_SIZE_KB 48
#define ELEMENT_SIZE 64

#define MAX_KB 64

static char   g_buffer[MAX_KB * 1024];
static size_t g_indices[(MAX_KB * 1024) / ELEMENT_SIZE];

static void overwrite_x_kb_l1(int KB)
{
    if (KB > MAX_KB)
    {
        KB = MAX_KB;
    }

    size_t total_bytes = (size_t)KB * 1024;
    size_t line_count = total_bytes / ELEMENT_SIZE;

    srand((unsigned int)time(NULL));

    for (size_t i = 0; i < total_bytes; i++)
    {
        g_buffer[i] = (char)(rand() & 0xFF);
    }

    for (size_t i = 0; i < line_count; i++)
    {
        g_indices[i] = i;
    }

    for (size_t i = line_count - 1; i > 0; i--)
    {
        size_t j = rand() % (i + 1);
        size_t tmp = g_indices[i];
        g_indices[i] = g_indices[j];
        g_indices[j] = tmp;
    }

    for (size_t i = 0; i < line_count; i++)
    {
        size_t offset = g_indices[i] * ELEMENT_SIZE;
        g_buffer[offset] ^= (char)rand();
    }
}

// this function is used to flush the pipeline
// cpuid instruction is used to serialize the pipeline
// meaning that all instructions issued before cpuid
// are guaranteed to complete before any instruction
// issued after cpuid
static inline void flush_cpu_pipeline()
{
    unsigned int a, b, c, d;

    asm volatile (
        "cpuid"
        : "=a" (a), "=b" (b), "=c" (c), "=d" (d)
        : "a" (0)
        :
        );

    // prints vendor string (ebx, edx, ecx)
    // printf("%c%c%c%c%c%c%c%c%c%c%c%c", b & 0xFF, (b >> 8) & 0xFF, (b >> 16) & 0xFF, (b >> 24) & 0xFF, d & 0xFF, (d >> 8) & 0xFF, (d >> 16) & 0xFF, (d >> 24) & 0xFF, c & 0xFF, (c >> 8) & 0xFF, (c >> 16) & 0xFF, (c >> 24) & 0xFF);
}

static size_t int_hash(int key, size_t num_buckets, int i)
{
    unsigned long long x = (unsigned long long)key;

    if (i % 2 == 0)
    {
        for (int i = 0; i < 55; i++)
        {
            x ^= (x << 13);
            x ^= (x >> 7);
            x ^= (x << 17);
        }
    }

    return (size_t)(x % num_buckets);
}

// delete node (unsafe - does not check if node is head)
#define DELETE_NODE(node) do {         \
    (node)->prev->next = (node)->next; \
    (node)->next->prev = (node)->prev; \
} while(0)

// insert node after insert_after
#define INSERT_NODE_AFTER(insert_after, node) do { \
    (node)->next = (insert_after)->next;           \
    (node)->prev = (insert_after);                 \
    (insert_after)->next->prev = (node);           \
    (insert_after)->next = (node);                 \
} while(0)

// insert node before insert_before
#define INSERT_NODE_BEFORE(insert_before, node) do { \
    (node)->next = (insert_before);                  \
    (node)->prev = (insert_before)->prev;            \
    (insert_before)->prev->next = (node);            \
    (insert_before)->prev = (node);                  \
} while(0)

#endif