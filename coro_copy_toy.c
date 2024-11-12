#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// util
int random_in_range(int min, int max)
{
    return rand() % (max - min + 1) + min;
}

// generates an array of access indices:
// [0, 1, 2, 3, 4, 5] gets scrambled to
// [3, 5, 0, 2, 4, 1] to confuse the hardware prefetcher
void generate_access_pattern(int* arr, int n)
{
    for (int i = 0; i < n; i++)
    {
        arr[i] = i;
    }

    for (int i = 0; i < n; i++)
    {
        int indx = random_in_range(i, n - 1);
        int tmp = arr[i];
        arr[i] = arr[indx];
        arr[indx] = tmp;
    }
}

typedef enum { INITIALIZING, EXECUTING, SWITCHING, UNUSED } coroutine_exec_state;

typedef struct
{
    coroutine_exec_state exec_state;
    int copy_indx;
} coroutine_context;

// cache line size is 64 bytes

int* array_from;
int* array_to;

size_t copy_batch = 16;

size_t alignment = 64; // = cache line size
size_t num_elements = 64 * 64 * 1024; // 16 MB

void coroutine(coroutine_context* ctx, int* total_ops)
{
    switch (ctx->exec_state)
    {
    case INITIALIZING:
        ctx->exec_state = EXECUTING;
        // The GCC doc here specifies the usage of _buitin_prefetch.
        // Third argument is perfect. If it is 0, compiler generates prefetchtnta (%rax) instruction
        // If it is 1, compiler generates prefetcht2 (%rax) instruction
        // If it is 2, compiler generates prefetcht1 (%rax) instruction
        // If it is 3 (default), compiler generates prefetcht0 (%rax) instruction.
        // If we vary third argument the opcode already changed accordingly.

        // prefetch address, 0-read/1-write, locality
        // locality:
        // A value of zero means that the data has no temporal locality, so it need not be left in the cache after the access
        // A value of three means that the data has a high degree of temporal locality and should be left in all levels of cache possible.
        // (3 will put the data in L1 or L2 likely)
        __builtin_prefetch(array_from + ctx->copy_indx, 0, 0);
        return;

    case EXECUTING:
        for (int i = 0; i < copy_batch; i++)
        {
            array_to[ctx->copy_indx + i] = array_from[ctx->copy_indx + i];
            (*total_ops)++;
        }
        ctx->exec_state = SWITCHING;
        return;

    case SWITCHING:
        return;

    case UNUSED:
        return;
    }
}

int init()
{
    // initialize the arrays (allocate alligned arrays)
    if (posix_memalign((void**)&array_from, alignment, num_elements * sizeof(int)) != 0)
    {
        return 1; // allocation failed
    }
    if (posix_memalign((void**)&array_to, alignment, num_elements * sizeof(int)) != 0)
    {
        return 2; // allocation failed
    }

    for (int i = 0; i < num_elements; i++)
    {
        array_from[i] = random_in_range(0, 255);
    }

    // initialize or use the array
    memset(array_to, 0, num_elements * sizeof(int));

    return 0;
}

void cleanup()
{
    free(array_from);
    free(array_to);
}

int main()
{
    if (init() != 0)
    {
        printf("init failed\n");
        cleanup();
        return 1;
    }

    float sum = 0;
    int cnt = 100;

    printf("init seq completed\n");

    printf("1 to 30, avg of %d\n", cnt);
    printf("num_elements: %d\n", num_elements);
    printf("copy_batch: %d\n", copy_batch);


    for (int num_coroutines = 1; num_coroutines <= 30; num_coroutines+=2)
    {
        for (int k = 0; k < cnt; k++)
        {
            int total_ops = 0;
            int copy_indx = 0;
            coroutine_context* ctxs = malloc(num_coroutines * sizeof(coroutine_context));

            for (int i = 0; i < num_coroutines; i++)
            {
                ctxs[i].exec_state = INITIALIZING;
                ctxs[i].copy_indx = copy_indx;
                copy_indx++;
            }

            int coroutines_active = num_coroutines;
            clock_t start_time = clock();

            while (coroutines_active > 0)
            {
                for (int i = 0; i < num_coroutines; i++)
                {
                    if (ctxs[i].exec_state != UNUSED)
                    {
                        if (ctxs[i].exec_state != SWITCHING)
                        {
                            coroutine(&ctxs[i], &total_ops);
                        }
                        else
                        {
                            if (copy_indx < num_elements)
                            {
                                ctxs[i].exec_state = INITIALIZING;
                                ctxs[i].copy_indx = copy_indx;
                                copy_indx += copy_batch;
                            }
                            else
                            {
                                ctxs[i].exec_state = UNUSED;
                                coroutines_active--;
                            }
                        }
                    }
                }
            }

            clock_t end_time = clock();
            double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
            double mops = total_ops / (elapsed_time * 1e6);
            // printf("Total ops with %d coroutines: %d, MOPS: %f\n", num_coroutines, total_ops, mops);
            int indx = random_in_range(0, num_elements);
            // printf("data @ %d: %c - %c\n", indx, data_from[indx], data_to[indx]);

            for (int i = 0; i < num_elements; i++)
            {
                array_to[i] = 0;
            }

            sum += mops;
            free(ctxs);
        }
        printf("%d %f\n", num_coroutines, sum / cnt);
        sum = 0;
    }

    // printf("avg: %d\n", sum / cnt);
    cleanup();
    return 0;
}