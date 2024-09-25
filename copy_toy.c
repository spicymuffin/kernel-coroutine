#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define OPCNT 1024 * 1024 * 10
#define CPYBATCHSZ 32

// util
int random_in_range(int min, int max)
{
    return rand() % (max - min + 1) + min;
}

typedef enum { INITIALIZING, EXECUTING, SWITCHING, UNUSED } coroutine_exec_state;

typedef struct
{
    coroutine_exec_state exec_state;
    int copy_indx;
} coroutine_context;

int access_pattern[OPCNT];

char data_from[OPCNT];
char data_to[OPCNT];

void coroutine(coroutine_context* ctx, int* total_ops)
{
    switch (ctx->exec_state)
    {
    case INITIALIZING:
        ctx->exec_state = EXECUTING;
        // prefetch address, 0-read/1-write, locality (im not sure what this does)
        __builtin_prefetch(data_from + ctx->copy_indx, 0, 1);
        __builtin_prefetch(data_to + ctx->copy_indx, 1, 1);
        return;

    case EXECUTING:
        (*total_ops)++;
        // for (int i = 0; i < CPYBATCHSZ; i++)
        // {
        data_to[ctx->copy_indx] = data_from[ctx->copy_indx];
        // }

        ctx->exec_state = SWITCHING;
        return;

    case SWITCHING:
    case UNUSED:
        return;
    }
}

void init_data()
{
    for (int i = 0; i < OPCNT; i++)
    {
        data_from[i] = random_in_range(0, 255);
    }
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

int main()
{
    init_data();
    generate_access_pattern(access_pattern, OPCNT);
    printf("init seq completed\n");

    float sum = 0;
    int cnt = 10;

    for (int num_coroutines = 1; num_coroutines <= 30; num_coroutines++)
    {
        for (int k = 0; k < cnt; k++)
        {
            int total_ops = 0;
            int copy_indx = 0;
            coroutine_context* ctxs = malloc(num_coroutines * sizeof(coroutine_context));

            for (int i = 0; i < num_coroutines; i++)
            {
                ctxs[i].exec_state = INITIALIZING;
                ctxs[i].copy_indx = access_pattern[copy_indx];
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
                            if (copy_indx < OPCNT)
                            {
                                ctxs[i].exec_state = INITIALIZING;
                                ctxs[i].copy_indx = access_pattern[copy_indx];
                                copy_indx++;
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
            int indx = random_in_range(0, OPCNT);
            // printf("data @ %d: %c - %c\n", indx, data_from[indx], data_to[indx]);

            for (int i = 0; i < OPCNT; i++)
            {
                data_to[indx] = '0';
            }

            sum += mops;
            free(ctxs);
        }
        printf("%d %f\n", num_coroutines, sum / cnt);
        sum = 0;
    }

    // printf("avg: %d\n", sum / cnt);

    return 0;
}