@echo off
echo ==========================================
echo Complete Multicore Programming Lab Setup
echo ==========================================
echo.

:: Create folders
echo Creating folders...
mkdir Experiment_01_OpenMP_Fork_Join
mkdir Experiment_02_Matrix_Vector_Multiplication
mkdir Experiment_03_Array_Sum_Parallel
mkdir Experiment_04_Message_Passing
mkdir Experiment_05_Floyds_Algorithm
mkdir Experiment_06_Matrix_Transpose
echo Folders created!
echo.

:: Create C files using echo with quotes
echo Creating C source files...

echo #include ^<stdio.h^> > Experiment_01_OpenMP_Fork_Join\fork_join.c
echo #include ^<omp.h^> >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo. >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo int main(void) { >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo     printf("Before: total thread number is %%d\n", omp_get_num_threads()); >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo     #pragma omp parallel >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo     { >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo         printf("Thread id is %%d\n", omp_get_thread_num()); >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo     } >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo     printf("After: total thread number is %%d\n", omp_get_num_threads()); >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo     return 0; >> Experiment_01_OpenMP_Fork_Join\fork_join.c
echo } >> Experiment_01_OpenMP_Fork_Join\fork_join.c

echo #include ^<stdio.h^> > Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo #include ^<omp.h^> >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo. >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo int main() { >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     float A[2][2] = {{1, 2}, {3, 4}}; >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     float x[] = {8, 10}; >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     float b[2]; >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     int i, j; >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     #pragma omp parallel for private(j) >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     for (i = 0; i ^< 2; i++) { >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo         b[i] = 0; >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo         for (j = 0; j ^< 2; j++) { >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo             b[i] = b[i] + A[i][j] * x[j]; >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo         } >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     } >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     for (i = 0; i ^< 2; i++) { >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo         printf("b[%%d] = %%f\n", i, b[i]); >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     } >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo     return 0; >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c
echo } >> Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c

echo #include ^<stdio.h^> > Experiment_03_Array_Sum_Parallel\array_sum.c
echo #include ^<omp.h^> >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo. >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo int main() { >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     int arr[] = {3, 1, 2, 5, 4, 0, 9, 7, 8, 6}; >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     int n = sizeof(arr) / sizeof(arr[0]); >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     int sum = 0; >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     int max_val = arr[0]; >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     int i; >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     #pragma omp parallel for reduction(+: sum) >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     for (i = 0; i ^< n; i++) { >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo         sum += arr[i]; >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     } >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     #pragma omp parallel for reduction(max: max_val) >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     for (i = 1; i ^< n; i++) { >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo         if (arr[i] ^> max_val) { >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo             max_val = arr[i]; >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo         } >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     } >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     printf("Array elements: "); >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     for (i = 0; i ^< n; i++) { >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo         printf("%%d ", arr[i]); >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     } >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     printf("\nSum of elements: %%d\n", sum); >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     printf("Largest number: %%d\n", max_val); >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo     return 0; >> Experiment_03_Array_Sum_Parallel\array_sum.c
echo } >> Experiment_03_Array_Sum_Parallel\array_sum.c

echo #include ^<omp.h^> > Experiment_04_Message_Passing\message_passing.c
echo #include ^<stdio.h^> >> Experiment_04_Message_Passing\message_passing.c
echo #include ^<stdlib.h^> >> Experiment_04_Message_Passing\message_passing.c
echo. >> Experiment_04_Message_Passing\message_passing.c
echo int main(int argc, char* argv[]) { >> Experiment_04_Message_Passing\message_passing.c
echo     #pragma omp parallel >> Experiment_04_Message_Passing\message_passing.c
echo     { >> Experiment_04_Message_Passing\message_passing.c
echo         printf("Hello World... from thread = %%d\n", omp_get_thread_num()); >> Experiment_04_Message_Passing\message_passing.c
echo     } >> Experiment_04_Message_Passing\message_passing.c
echo     return 0; >> Experiment_04_Message_Passing\message_passing.c
echo } >> Experiment_04_Message_Passing\message_passing.c

echo #include ^<stdio.h^> > Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo #include ^<omp.h^> >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo #define N 4 >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo #define INF 99999 >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo #ifndef min >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo #define min(a,b) (((a) ^< (b)) ? (a) : (b)) >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo #endif >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo. >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo int main() { >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     int dist[N][N] = {{0, 3, INF, 7}, {3, 0, 2, INF}, {INF, 2, 0, 1}, {7, INF, 1, 0}}; >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     int i, j, k; >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     printf("Original Distance Matrix:\n"); >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     for (i = 0; i ^< N; i++) { >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo         for (j = 0; j ^< N; j++) { >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo             if (dist[i][j] == INF) printf("INF "); else printf("%%d   ", dist[i][j]); >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo         } >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo         printf("\n"); >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     } >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     for (k = 0; k ^< N; k++) { >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo         #pragma omp parallel for private(i, j) shared(dist) >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo         for (i = 0; i ^< N; i++) { >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo             for (j = 0; j ^< N; j++) { >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo                 dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j]); >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo             } >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo         } >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     } >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     printf("\nAll-Pairs Shortest Path Matrix:\n"); >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     for (i = 0; i ^< N; i++) { >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo         for (j = 0; j ^< N; j++) { >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo             if (dist[i][j] == INF) printf("INF "); else printf("%%d   ", dist[i][j]); >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo         } >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo         printf("\n"); >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     } >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo     return 0; >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c
echo } >> Experiment_05_Floyds_Algorithm\floyds_algorithm.c

echo #include ^<stdio.h^> > Experiment_06_Matrix_Transpose\matrix_transpose.c
echo #include ^<omp.h^> >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo #define N 3 >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo. >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo int main() { >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     int A[N][N] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}; >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     int B[N][N]; >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     int i, j; >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     printf("Original Matrix A:\n"); >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     for (i = 0; i ^< N; i++) { >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo         for (j = 0; j ^< N; j++) { >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo             printf("%%d ", A[i][j]); >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo         } >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo         printf("\n"); >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     } >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     #pragma omp parallel for private(j) >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     for (i = 0; i ^< N; i++) { >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo         for (j = 0; j ^< N; j++) { >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo             B[j][i] = A[i][j]; >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo         } >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     } >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     printf("\nTransposed Matrix B:\n"); >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     for (i = 0; i ^< N; i++) { >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo         for (j = 0; j ^< N; j++) { >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo             printf("%%d ", B[i][j]); >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo         } >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo         printf("\n"); >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     } >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo     return 0; >> Experiment_06_Matrix_Transpose\matrix_transpose.c
echo } >> Experiment_06_Matrix_Transpose\matrix_transpose.c

echo C files created!
echo.

:: Create README files
echo Creating README files...

(
echo # MULTICORE ARCHITECTURE AND PROGRAMMING
echo.
echo ## 1. OpenMP Fork-Join Parallelism
echo.
echo ### AIM:
echo To demonstrate OpenMP Fork-Join Parallelism.
echo.
echo ### ALGORITHM:
echo Step 1: Start
echo Step 2: Include stdio.h and omp.h
echo Step 3: Print threads before parallel region
echo Step 4: Create parallel region
echo Step 5: Each thread prints its ID
echo Step 6: Print threads after parallel region
echo Step 7: Stop
echo.
echo ### Source Code: fork_join.c
echo ### OUTPUT: Thread IDs printed
echo ### Result: Program executed successfully
) > Experiment_01_OpenMP_Fork_Join\README.md

(
echo # MULTICORE ARCHITECTURE AND PROGRAMMING
echo.
echo ## 2. Matrix-Vector Multiplication
echo.
echo ### AIM:
echo To compute b=Ax using OpenMP.
echo.
echo ### ALGORITHM:
echo Step 1: Initialize matrix A and vector x
echo Step 2: Parallelize outer loop
echo Step 3: Compute dot product for each row
echo Step 4: Print result vector b
echo Step 5: Stop
echo.
echo ### Source Code: matrix_vector.c
echo ### OUTPUT: Result vector b
echo ### Result: Program executed successfully
) > Experiment_02_Matrix_Vector_Multiplication\README.md

(
echo # MULTICORE ARCHITECTURE AND PROGRAMMING
echo.
echo ## 3. Array Sum and Maximum
echo.
echo ### AIM:
echo To find sum and largest number in array using OpenMP.
echo.
echo ### ALGORITHM:
echo Step 1: Initialize array
echo Step 2: Use reduction for sum
echo Step 3: Use reduction for max
echo Step 4: Print results
echo Step 5: Stop
echo.
echo ### Source Code: array_sum.c
echo ### OUTPUT: Sum and max value
echo ### Result: Program executed successfully
) > Experiment_03_Array_Sum_Parallel\README.md

(
echo # MULTICORE ARCHITECTURE AND PROGRAMMING
echo.
echo ## 4. Message Passing
echo.
echo ### AIM:
echo To demonstrate message passing with OpenMP.
echo.
echo ### ALGORITHM:
echo Step 1: Create parallel region
echo Step 2: Each thread prints message
echo Step 3: End parallel region
echo.
echo ### Source Code: message_passing.c
echo ### OUTPUT: Thread messages
echo ### Result: Program executed successfully
) > Experiment_04_Message_Passing\README.md

(
echo # MULTICORE ARCHITECTURE AND PROGRAMMING
echo.
echo ## 5. Floyd's Algorithm
echo.
echo ### AIM:
echo To implement All-Pairs Shortest Path using OpenMP.
echo.
echo ### ALGORITHM:
echo Step 1: Initialize distance matrix
echo Step 2: For each k, parallelize i loop
echo Step 3: Update distances
echo Step 4: Print final matrix
echo Step 5: Stop
echo.
echo ### Source Code: floyds_algorithm.c
echo ### OUTPUT: Shortest path matrix
echo ### Result: Program executed successfully
) > Experiment_05_Floyds_Algorithm\README.md

(
echo # MULTICORE ARCHITECTURE AND PROGRAMMING
echo.
echo ## 6. Matrix Transpose
echo.
echo ### AIM:
echo To find transpose of matrix using OpenMP.
echo.
echo ### ALGORITHM:
echo Step 1: Initialize matrix A
echo Step 2: Parallelize row traversal
echo Step 3: B[j][i] = A[i][j]
echo Step 4: Print transposed matrix
echo Step 5: Stop
echo.
echo ### Source Code: matrix_transpose.c
echo ### OUTPUT: Transposed matrix B
echo ### Result: Program executed successfully
) > Experiment_06_Matrix_Transpose\README.md

echo README files created!
echo.

:: Create main README
(
echo # Multicore Programming Lab
echo.
echo ## Student: 212225340001
echo.
echo ## Experiments
echo.
echo 1. OpenMP Fork-Join Parallelism
echo 2. Matrix-Vector Multiplication
echo 3. Array Sum and Maximum
echo 4. Message Passing
echo 5. Floyd's Algorithm
echo 6. Matrix Transpose
echo.
echo ## Compile: gcc -fopenmp file.c -o file.exe
echo ## Run: file.exe
) > README.md

echo Main README created!
echo.

:: Git setup
echo Initializing Git...
git init
git add .
git commit -m "Initial commit: All 6 experiments"

echo.
echo ==========================================
echo SETUP COMPLETE!
echo ==========================================
echo.
echo Run these commands to push:
echo git remote add origin https://github.com/bharath-s-ai/multicore-programming-lab_212225340001.git
echo git push -u origin main
echo.
pause