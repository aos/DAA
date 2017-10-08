## Strassen's Subcubic Matrix Multiplication Algorithm

In a straightforward iterative approach to matrix multiplication of `n`
the standard running time for this algorithm would be `n^3`.

Can we do better? Use divide and conquer.

### Applying Divide and Conquer

#### Recursive Algorithm #1
1. Recursively compute the 8 necessary products.
2. Do the necessary additions `O(n^2) time`

Fact: Runtime is `O(n^3)` -- follows the master method

### Strassen's Algorithm
1. Recursively compute only 7 (cleverly chosen) products
2. Do the necessary (clever) additions and substractions (still `O(n^2)`)

Fact: Better than cubic time! (See master method)

### The Details

Given a problem: `X * Y`
```
X =
[A B
 C D]

Y = 
[E F
 G H]

The product of which equals:
[(AE + BG)   (AF + BH)
 (CE + DG)   (CF + DH)]
```

The 7 products are:

`P1` = `A(F - H)`, `P2` = `(A + B)H`, `P3` = `(C + D)E`, `P4` = `D(G - E)`,

`P5` = `(A + D)(E + H)`, `P6` = `(B - D)(G + H)`, `P7` = `(A - C)(E + F)`
