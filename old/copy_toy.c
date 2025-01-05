#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

// util
int random_in_range(int min, int max)
{
    return rand() % (max - min + 1) + min;
}

#define ARRAY_SIZE 1000000

int main()
{
    int total_ops = 0;
    int array_from[ARRAY_SIZE];
    int array_to[ARRAY_SIZE];

    // initialize the array
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        total_ops++;
        array_from[i] = random_in_range(-12345, 12345);
    }


    clock_t start_time = clock();

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        array_to[i] = array_from[i];
    }

    clock_t end_time = clock();
    double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
    double mops = total_ops / (elapsed_time * 1e6);

    printf("total ops: %d, MOPS: %f\n", total_ops, mops);

    return 0;
}