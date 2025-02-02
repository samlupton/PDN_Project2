#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
#include <omp.h>

#define DEBUG 0

/* ----------- Project 2 - Problem 1 - Matrix Mult -----------

    This file will multiply two matricies.
    Complete the TODOs in order to complete this program.
    Remember to make it parallelized!
*/ // ------------------------------------------------------ //

int main(int argc, char* argv[])
{
    // Catch console errors
    if (argc != 10)
    {
        printf("USE LIKE THIS: parallel_mult_mat_mat file_A.csv n_row_A n_col_A file_B.csv n_row_B n_col_B result_matrix.csv time.csv num_threads \n");
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

    // printf("\nLoading matrix1...\n");

    char line[1000000];

    for (int i = 0; i < n_row1; i++) {
        fgets(line, sizeof(line), inputMatrix1);
        char *token = strtok(line, ",");
        for (int j = 0; j < n_col1; j++) {
            // printf("token = %s\n", token);
            matrix1[i * n_col1 + j] = atoi(token);
            token = strtok(NULL, ",");
        }
    }

    // printf("\nLoading matrix2...\n");

    for (int i = 0; i < n_row2; i++) {
        fgets(line, sizeof(line), inputMatrix2);
        char *token = strtok(line, ",");
        for (int j = 0; j < n_col2; j++) {
            // printf("token = %s\n", token);
            matrix2[i * n_col2 + j] = atoi(token);
            token = strtok(NULL, ",");
        }
    }
        
    // printf("\n");
    // printf("Done loading matrix1...\n");
    // printf("Printing every element of matrix1...\n");
    // printf("\n");
    // /opt/homebrew/bin/gcc-14 -fopenmp parallel_mult_mat_mat.c -o parallel_mult_mat_mat 

    // for (int i = 0; i < n_col1; i++) {
    //     printf("row %d: ", i);
    //     for (int j = 0; j < n_row1; j++) {
    //         printf("%ld", matrix1[i * n_col1 + j]);
    //     }
    //     printf("\n");
    // }

    // printf("\n");
    // printf("Done loading matrix2...\n");
    // printf("Printing every element of matrix2...\n");
    // printf("\n");

    // for (int i = 0; i < n_col2; i++) {
    //     printf("row %d: ", i);
    //     for (int j = 0; j < n_row2; j++) {
    //         printf("%ld", matrix2[i * n_col2 + j]);
    //     }
    //     printf("\n");
    // }

    // We are interesting in timing the matrix-matrix multiplication only
    // Record the start time

    // printf("\n");
    // printf("Beginning matrix multiplication...\n");
    // printf("\n");
    // printf("We are required to only time the multiplication...\n");
    // printf("So, I will configure the mutiplication outside the timer...\n");
    // printf("Configuring multiplication now...\n");
    // printf("\n");

    // printf("Matrix 1 info:\n");
    // printf("Matrix 1 rows = %d\n", n_row1);
    // printf("Matrix 1 columns = %d\n", n_col1);
    // printf("\n");
    // printf("Matrix 2 info:\n");
    // printf("Matrix 2 rows = %d\n", n_row2);
    // printf("Matrix 2 columns = %d\n", n_col2);
    // printf("\n");
    
    double start = omp_get_wtime();
    
    // TODO: Parallelize the matrix-matrix multiplication

    omp_set_num_threads(thread_count);
    #pragma omp parallel for collapse(2)
    for (int i = 0; i < n_row1; i++) {
        for (int j = 0; j < n_col2; j++) {
            long int sum = 0;
            for (int k = 0; k < n_col1; k++) {
                sum += matrix1[i * n_col1 + k] * matrix2[k * n_col2 + j];
            }
            result[i * n_col2 + j] = sum;
        }
    }

    // Record the finish time        
    double end = omp_get_wtime();
    
    // Time calculation (in seconds)
    double time_passed = end - start;

    printf("\nTotal time = %f\n", time_passed);

    // Save time to file
    fprintf(outputTime, "%f", time_passed);

    // TODO: save the output matrix to the output csv file
    
    for (int i = 0; i < n_row1; i++) {
        for (int j = 0; j < n_col2; j++) {
            fprintf(outputFile, "%ld ", result[i * n_col2 + j]);
        }
        fprintf(outputFile, "\n");
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
