# Experiment 8: MPI Scatter, Gather, and Allgather

## Aim
To write a program demonstrating MPI Scatter, Gather, and Allgather in C.

## Algorithm
1. Start
2. Initialize MPI and get rank, size
3. Root process creates array of random numbers
4. Scatter data to all processes using MPI_Scatter
5. Each process computes local average
6. Gather all local averages using MPI_Allgather
7. Compute global average from gathered data
8. Print results from all processes
9. Finalize MPI
10. Stop

## Compilation
```bash
mpicc mpi_scatter_gather.c -o mpi_scatter_gather
```

## Execution
```bash
mpirun -n 4 ./mpi_scatter_gather 100
```
