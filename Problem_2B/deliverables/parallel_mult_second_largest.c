#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
#include <limits.h>
#include <omp.h>

#define DEBUG 0

/* ----------- Project 2 - Problem 2 B - Second Max Value -----------

    This file will multiply two matricies.
    Complete the TODOs in order to complete this program.
    Remember to make it parallelized!
*/ // ------------------------------------------------------ //

int max(int a, int b);
int min(int a, int b);

int main(int argc, char* argv[])
{
    // Catch console errors
    if (argc != 10)
    {
        printf("USE LIKE THIS: parallel_mult_max file_A.csv n_row_A n_col_A file_B.csv n_row_B n_co _B result_maximum.csv time.csv num_threads \n");
        return EXIT_FAILURE;
    }

    // Get the input files
    FILE* inputMatrix1 = fopen(argv[1], "r");
    FILE* inputMatrix2 = fopen(argv[4], "r");

    char* p1;
    char* p2;

    // Get matrix 1's dims
    int n_row1 = strtol(argv[2], &p1, 10);
    int n_col1 = strtol(argv[3], &p2, 10);

    // Get matrix 2's dims
    int n_row2 = strtol(argv[5], &p1, 10);
    int n_col2 = strtol(argv[6], &p2, 10);

      if (n_col1 != n_row2) {
        printf("\n");
        printf("Error: dimension mismatch.\n");
        printf("Inner dimensions must match.\n");
        printf("\n");
        return EXIT_FAILURE;
    }

    // Get num threads
    int thread_count = strtol(argv[9], NULL, 10);

    // Get output files
    FILE* outputFile = fopen(argv[7], "w");
    FILE* outputTime = fopen(argv[8], "w");


    // TODO: malloc the two input matrices and the output matrix
    // Please use long int as the variable type
    long int *matrix1 = (long int *)malloc(n_col1 * n_row1 * sizeof(long int));
    long int *matrix2 = (long int *)malloc(n_col2 * n_row2 * sizeof(long int));
    long int *result = (long int *)malloc(n_row1 * n_col2 * sizeof(long int));


    // TODO: Parse the input csv files and fill in the input matrices

    char line[1000000];

    for (int i = 0; i < n_row1; i++) {
        fgets(line, sizeof(line), inputMatrix1);
        char *token = strtok(line, ",");
        for (int j = 0; j < n_col1; j++) {
            matrix1[i * n_col1 + j] = atoi(token);
            token = strtok(NULL, ",");
        }
    }

    for (int i = 0; i < n_row2; i++) {
        fgets(line, sizeof(line), inputMatrix2);
        char *token = strtok(line, ",");
        for (int j = 0; j < n_col2; j++) {
            matrix2[i * n_col2 + j] = atoi(token);
            token = strtok(NULL, ",");
        }
    }
    
    double start = omp_get_wtime();
    
    // TODO: Parallelize the matrix-matrix multiplication

    int maxValue = INT_MIN;
    int secondMax = INT_MIN;

    #pragma omp parallel for num_threads(thread_count)
    for (int i = 0; i < n_row1; i++) {
        for (int j = 0; j < n_col2; j++) {
            long int sum = 0;
            for (int k = 0; k < n_col1; k++) {
                sum += matrix1[i * n_col1 + k] * matrix2[k * n_col2 + j];
            }
        
            result[i * n_col2 + j] = sum;

            // #pragma omp critical 
            if (sum > maxValue) {
                secondMax = maxValue;
                maxValue = sum;
            } else if (sum > secondMax && sum < maxValue) {
                secondMax = sum;
            }
        }
    }

    // Record the finish time        
    double end = omp_get_wtime();

    // printf("second max calculated with the multi-thread program is %d\n", secondMax);

    int largest = INT_MIN;
    int secondLargest = INT_MIN;

    for (int i = 0; i < n_row1 * n_col2; i++) {
        if (result[i] > largest) {
            secondLargest = largest;
            largest = result[i];
        } else if (result[i] > secondLargest && result[i] != largest) {
            secondLargest = result[i];
        }
    }

    // printf("second max calculated with the single-thread program is %d\n", secondLargest);

    // for (int i = 0; i < n_row1 * n_col2; i++) {
    //     maxValue = max(maxValue, result[i]);
    // }

    // printf("maxValue calculated with the single thread program is %d\n", maxValue);

    if (secondLargest == secondMax) {
        printf("✅✅✅ Correct ✅✅✅");
    }
    else {
        printf("❌❌❌ Incorrect ❌❌❌");
        printf("maxValue = %d", maxValue);
    }

    printf("(multi, single) = (%d,%d)\n", secondMax, secondLargest);

    // Time calculation (in seconds)
    double time_passed = end - start;

    // printf("\nTotal time = %f\n", time_passed);

    // Save time to file
    fprintf(outputTime, "%f", time_passed);

    // TODO: save the second max value in the matrix to the output csv file

    // fprintf(outputFile, "maxValue = %d, secondMaxValue = %d ", maxValue, secondMaxValue);
    fprintf(outputFile, "%d", secondMax);

    FILE* outPutMatrix = fopen("result.csv", "w");

     for (int i = 0; i < n_row1; i++) {
        for (int j = 0; j < n_col2; j++) {
            fprintf(outPutMatrix, "%ld ", result[i * n_col2 + j]);
        }
        fprintf(outPutMatrix, "\n");
    }
    
    // Cleanup
    fclose(inputMatrix1);
    fclose(inputMatrix2);
    fclose(outputFile);
    fclose(outputTime);
    // Remember to free your buffers!

    free(matrix1);
    free(matrix2);
    free(result);

    return 0;
}

int max(int a, int b) {
    return a > b ? a : b;
}

int min(int a, int b) {
    return a < b ? a : b;
}