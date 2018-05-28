# A Reconstruction Algorithm

**Recall**:
```
A[0] = 0
A[1] = w_1
For i = 1, 2, 3, 4, ... n:
  A[i] = max { A[i - 1], A[i - 2] + w_i }
```
**Note**: Algorithm computes the *value* of a max-weight IS, not such an IS
itself

**Better**: Trace back through filled-in array to reconstruct optimal solution

**Key point**: We know that a vertex `v_i` belongs to a max-weight IS of `G_i`

# Pseudocode
```
Let A = filled-in array

- Let S = 0
- While i >= 1                      # Scan through array from right to left
  - if A[i - 1] >= A[i - 2] + w_i   # (i.e, case 1 wins)
    - decrease i by 1
  - else                            # (i.e, case 2 wins)
    - add v_i to S, decrease i by 2
- Return S
```
