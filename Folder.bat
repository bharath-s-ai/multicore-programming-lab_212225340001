@echo off
echo Creating all experiment folders and files...

:: Create folders
mkdir Experiment_01_OpenMP_Fork_Join
mkdir Experiment_02_Matrix_Vector_Multiplication
mkdir Experiment_03_Array_Sum_Parallel
mkdir Experiment_04_Message_Passing
mkdir Experiment_05_Floyds_Algorithm
mkdir Experiment_06_Matrix_Transpose

:: Experiment 1
(
echo #include ^<stdio.h^>
echo #include ^<omp.h^>
echo.
echo int main^(void^) ^{
echo     printf^("Before: total thread number is %%d\n", omp_get_num_threads^(^)^);
echo     #pragma omp parallel
echo     ^{
echo         printf^("Thread id is %%d\n", omp_get_thread_num^(^)^);
echo     ^}
echo     printf^("After: total thread number is %%d\n", omp_get_num_threads^(^)^);
echo     return 0;
echo ^}
) > Experiment_01_OpenMP_Fork_Join\fork_join.c

:: Experiment 2
(
echo #include ^<stdio.h^>
echo #include ^<omp.h^>
echo.
echo int main^(^) ^{
echo     float A[2][2] = ^{^{1, 2^}, ^{3, 4^}^};
echo     float x[] = ^{8, 10^};
echo     float b[2];
echo     int i, j;
echo.
echo     #pragma omp parallel for private^(j^)
echo     for ^(i = 0; i ^< 2; i++^) ^{
echo         b[i] = 0;
echo         for ^(j = 0; j ^< 2; j++^) ^{
echo             b[i] = b[i] + A[i][j] * x[j];
echo         ^}
echo     ^}
echo.
echo     for ^(i = 0; i ^< 2; i++^) ^{
echo         printf^("b[%%d] = %%f\n", i, b[i]^);
echo     ^}
echo.
echo     return 0;
echo ^}
) > Experiment_02_Matrix_Vector_Multiplication\matrix_vector.c

:: Experiment 3
(
echo #include ^<stdio.h^>
echo #include ^<omp.h^>
echo.
echo int main^(^) ^{
echo     int arr[] = ^{3, 1, 2, 5, 4, 0, 9, 7, 8, 6^};
echo     int n = sizeof^(arr^) / sizeof^(arr[0]^);
echo     int sum = 0;
echo     int max_val = arr[0];
echo     int i;
echo.
echo     #pragma omp parallel for reduction^(+: sum^)
echo     for ^(i = 0; i ^< n; i++^) ^{
echo         sum += arr[i];
echo     ^}
echo.
echo     #pragma omp parallel for reduction^(max: max_val^)
echo     for ^(i = 1; i ^< n; i++^) ^{
echo         if ^(arr[i] ^> max_val^) ^{
echo             max_val = arr[i];
echo         ^}
echo     ^}
echo.
echo     printf^("Array elements: "^);
echo     for ^(i = 0; i ^< n; i++^) ^{
echo         printf^("%%d ", arr[i]^);
echo     ^}
echo.
echo     printf^("\nSum of elements: %%d\n", sum^);
echo     printf^("Largest number: %%d\n", max_val^);
echo.
echo     return 0;
echo ^}
) > Experiment_03_Array_Sum_Parallel\array_sum.c

:: Experiment 4
(
echo #include ^<omp.h^>
echo #include ^<stdio.h^>
echo #include ^<stdlib.h^>
echo.
echo int main^(int argc, char* argv[]^) ^{
echo     #pragma omp parallel
echo     ^{
echo         printf^("Hello World... from thread = %%d\n", omp_get_thread_num^(^)^);
echo     ^}
echo.
echo     return 0;
echo ^}
) > Experiment_04_Message_Passing\message_passing.c

:: Experiment 5
(
echo #include ^<stdio.h^>
echo #include ^<omp.h^>
echo.
echo #define N 4
echo #define INF 99999
echo.
echo #ifndef min
echo #define min^(a,b^) ^(((a^) ^< ^(b^)^) ? ^(a^) : ^(b^)^)
echo #endif
echo.
echo int main^(^) ^{
echo     int dist[N][N] = ^{
echo         ^{0, 3, INF, 7^},
echo         ^{3, 0, 2, INF^},
echo         ^{INF, 2, 0, 1^},
echo         ^{7, INF, 1, 0^}
echo     ^};
echo     int i, j, k;
echo.
echo     printf^("Original Distance Matrix:\n"^);
echo     for ^(i = 0; i ^< N; i++^) ^{
echo         for ^(j = 0; j ^< N; j++^) ^{
echo             if ^(dist[i][j] == INF^)
echo                 printf^("INF "^);
echo             else
echo                 printf^("%%d   ", dist[i][j]^);
echo         ^}
echo         printf^("\n"^);
echo     ^}
echo.
echo     for ^(k = 0; k ^< N; k++^) ^{
echo         #pragma omp parallel for private^(i, j^) shared^(dist^)
echo         for ^(i = 0; i ^< N; i++^) ^{
echo             for ^(j = 0; j ^< N; j++^) ^{
echo                 dist[i][j] = min^(dist[i][j], dist[i][k] + dist[k][j]^);
echo             ^}
echo         ^}
echo     ^}
echo.
echo     printf^("\nAll-Pairs Shortest Path Matrix:\n"^);
echo     for ^(i = 0; i ^< N; i++^) ^{
echo         for ^(j = 0; j ^< N; j++^) ^{
echo             if ^(dist[i][j] == INF^)
echo                 printf^("INF "^);
echo             else
echo                 printf^("%%d   ", dist[i][j]^);
echo         ^}
echo         printf^("\n"^);
echo     ^}
echo.
echo     return 0;
echo ^}
) > Experiment_05_Floyds_Algorithm\floyds_algorithm.c

:: Experiment 6
(
echo #include ^<stdio.h^>
echo #include ^<omp.h^>
echo.
echo #define N 3
echo.
echo int main^(^) ^{
echo     int A[N][N] = ^{
echo         ^{1, 2, 3^},
echo         ^{4, 5, 6^},
echo         ^{7, 8, 9^}
echo     ^};
echo     int B[N][N];
echo     int i, j;
echo.
echo     printf^("Original Matrix A:\n"^);
echo     for ^(i = 0; i ^< N; i++^) ^{
echo         for ^(j = 0; j ^< N; j++^) ^{
echo             printf^("%%d ", A[i][j]^);
echo         ^}
echo         printf^("\n"^);
echo     ^}
echo.
echo     #pragma omp parallel for private^(j^)
echo     for ^(i = 0; i ^< N; i++^) ^{
echo         for ^(j = 0; j ^< N; j++^) ^{
echo             B[j][i] = A[i][j];
echo         ^}
echo     ^}
echo.
echo     printf^("\nTransposed Matrix B:\n"^);
echo     for ^(i = 0; i ^< N; i++^) ^{
echo         for ^(j = 0; j ^< N; j++^) ^{
echo             printf^("%%d ", B[i][j]^);
echo         ^}
echo         printf^("\n"^);
echo     ^}
echo.
echo     return 0;
echo ^}
) > Experiment_06_Matrix_Transpose\matrix_transpose.c

echo All folders and files created successfully!
echo.
echo Now compiling and running all experiments...

:: Compile and run all
cd Experiment_01_OpenMP_Fork_Join
gcc -fopenmp fork_join.c -o fork_join.exe
echo [1] Fork-Join:
fork_join.exe
cd ..

cd Experiment_02_Matrix_Vector_Multiplication
gcc -fopenmp matrix_vector.c -o matrix_vector.exe
echo [2] Matrix-Vector:
matrix_vector.exe
cd ..

cd Experiment_03_Array_Sum_Parallel
gcc -fopenmp array_sum.c -o array_sum.exe
echo [3] Array Sum and Max:
array_sum.exe
cd ..

cd Experiment_04_Message_Passing
gcc -fopenmp message_passing.c -o message_passing.exe
echo [4] Message Passing:
message_passing.exe
cd ..

cd Experiment_05_Floyds_Algorithm
gcc -fopenmp floyds_algorithm.c -o floyds_algorithm.exe
echo [5] Floyd's Algorithm:
floyds_algorithm.exe
cd ..

cd Experiment_06_Matrix_Transpose
gcc -fopenmp matrix_transpose.c -o matrix_transpose.exe
echo [6] Matrix Transpose:
matrix_transpose.exe
cd ..

echo.
echo All experiments completed!
pause