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

// cache line size is 64 bytes

int* array_from;
int* array_to;

size_t alignment = 64; // = cache line size
size_t num_elements = 64 * 64 * 1024; // 16 MB

int init()
{
    // initialize the arrays (allocate alligned arrays)
    if (posix_memalign((void**)&array_from, alignment, num_elements * sizeof(int)) != 0)
    {
        return 1; // allocation failed
    }
    // initialize the arrays (allocate alligned arrays)
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
    printf("regular copy\n");
    printf("avg of %d\n", cnt);
    printf("num_elements: %d\n", num_elements);


    for (int k = 0; k < cnt; k++)
    {
        int total_ops = 0;
        int copy_indx = 0;

        clock_t start_time = clock();

        for (int i = 0; i < num_elements; i++)
        {
            array_to[i] = array_from[i];
            total_ops++;
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
    }


    printf("avg: %f\n", sum / cnt);
    cleanup();
    return 0;
}