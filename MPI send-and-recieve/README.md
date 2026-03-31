# Experiment 9: MPI Send and Receive

## Aim
To write a program demonstrating MPI point-to-point communication using Send and Receive in C.

## Algorithm
1. Start
2. Initialize MPI environment
3. Get process rank and size
4. If rank is 0, allocate and initialize array
5. Process 0 sends data to Process 1 using MPI_Send
6. Process 1 receives data using MPI_Recv
7. Process 1 prints received data
8. Free allocated memory
9. Finalize MPI
10. Stop

## Compilation
```bash
mpicc mpi_send_receive.c -o mpi_send_receive
```

## Execution
```bash
mpirun -n 2 ./mpi_send_receive
```
