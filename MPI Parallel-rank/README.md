# Experiment 10: Parallel Rank with MPI

## Aim
To write a program demonstrating parallel sorting (ranking) using MPI in C.

## Algorithm
1. Start
2. Initialize MPI environment
3. Each process generates random number
4. Use MPI_Allgather to collect all numbers
5. Each process counts how many numbers are smaller than its own
6. This count is the rank of the number in sorted order
7. Print original number and its rank
8. Finalize MPI
9. Stop

## Compilation
```bash
mpicc mpi_parallel_rank.c -o mpi_parallel_rank
```

## Execution
```bash
mpirun -n 4 ./mpi_parallel_rank
```
