# Experiment 7: MPI Broadcast

## Aim
To write a program demonstrating MPI broadcast collective communication in C.

## Algorithm
1. Start
2. Initialize MPI environment
3. Get process rank and size
4. If rank is 0, initialize data buffer
5. Call MPI_Bcast to broadcast data from root to all processes
6. All processes print received data
7. Finalize MPI
8. Stop

## Compilation
```bash
mpicc mpi_broadcast.c -o mpi_broadcast
```

## Execution
```bash
mpirun -n 4 ./mpi_broadcast
```
