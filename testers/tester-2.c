/**
 * malloc
 * CS 341 - Spring 2025
 */
#include "tester-utils.h"

#define TOTAL_ALLOCS 5 * M

int main(int argc, char *argv[]) {
    malloc(1);

    int i;
    int **arr = malloc(TOTAL_ALLOCS * sizeof(int *));
    if (arr == NULL) {
        fprintf(stderr, "Memory failed to allocate!\n");
        return 1;
    }
    // fprintf(stderr, "%lu\n", TOTAL_ALLOCS * sizeof(int *) + TOTAL_ALLOCS * 28);
    for (i = 0; i < TOTAL_ALLOCS; i++) {
        arr[i] = malloc(sizeof(int));
        if (arr[i] == NULL) {
            fprintf(stderr, "Memory failed to allocate!\n");
            return 1;
        }

        *(arr[i]) = i;
    }

    for (i = 0; i < TOTAL_ALLOCS; i++) {
        // fprintf(stderr, "Expected: %d, Got: %d\n", i, *(arr[i]));
        if (*(arr[i]) != i) {
            fprintf(stderr, "Memory failed to contain correct data after many "
                            "allocations!\n");
            return 2;
        }
    }

    for (i = 0; i < TOTAL_ALLOCS; i++)
        free(arr[i]);

    free(arr);
    fprintf(stderr, "Memory was allocated, used, and freed!\n");
    return 0;
}
