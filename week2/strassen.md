## Strassen's Subcubic Matrix Multiplication Algorithm

In a straightforward iterative approach to matrix multiplication of `n`
the standard running time for this algorithm would be `n^3`.

Can we do better? Use divide and conquer.

### Applying Divide and Conquer

#### Recursive Algorithm #1
1. Recursively compute the 8 necessary products.
2. Do the necessary additions `O(n^2) time`

Fact: Runtime is `O(n^3)` -- follows the master method
