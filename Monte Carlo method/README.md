# Experiment 6: Parallel Random Number Generators using Monte Carlo Methods

## Aim
To implement Parallel Random Number Generators using Monte Carlo method to estimate value of Pi in OpenMP.

## Algorithm
1. Start
2. Initialize number of points N and threads K
3. Initialize circle count and square count to 0
4. Parallelize loop with reduction on counts
5. For each point, generate random x,y between 0 and 1
6. Calculate distance d = x*x + y*y
7. If d <= 1, increment circle count
8. Increment square count
9. Calculate Pi = 4.0 * (circle_count / square_count)
10. Print estimated Pi value
11. Stop

## Compilation
```bash
gcc -fopenmp monte_carlo_pi.c -o monte_carlo_pi
```

## Execution
```bash
.\monte_carlo_pi
```
