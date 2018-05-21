# Linear time algorithm

**Proposed algorithm**:
- Recursively compute `S_1 = max-weight IS of G'`
- Recursively compute `S_2 = max-weight IS of G''`
- Return `S_1` or `S_2 ∪ {v_n}`, whichever is better

**Important question**:  
How many distinct subproblems ever get solved by this algorithm?  **O(n)**
- Only a linear # of distinct subproblems can be solved

## Eliminating redundancy

**Obvious fix**: The first time you solve a subproblem, cache its solution in a
global table for `O(1)`-time lookup later on ("*memoization*")

- Reformulate as a bottom-up iterative algorithm:
```
Let G_i = 1st i vertices of G
```
- **Plan**: Populate array `A` left to right with `A[i] = max-weight IS of G_i`
- **Initialization**:
```
A[0] = 0, A[1] = w_1
```
- **Main loop**:
```
For i = 2, 3, 4, ..., n:
  A[i] = max { A[i - 1], A[i - 2] + w_i }                 # { Case 1, Case 2 }
```
