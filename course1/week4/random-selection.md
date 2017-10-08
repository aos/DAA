## Randomized Selection
For every input array of length `n`, the average running time of `RSelect` is `O(n)`

- Holds for *every* input [no assumptions on data]
- "Average" is over random pivot choices made by the algorithm
```
RSelect(array A, length n, order statistic i):

  if n = 1, return A[1] // Base case

  Choose pivot p from A uniformly at random

  Partition: A around p
  let j = new index of p (p order statistic)

  if j = i, return p
  if j > i, return RSelect(1st part of A, j - 1, i) // On the left
  if j < i, return RSelect(2nd part of A, n - j, i - j) // On the right
```

## Randomized Selection Analysis

### Tracking progress via phases
**Notation**: `RSelect` is in `phase j` if current array size is between `((3/4)^(j + 1)) * n` and `((3/4)^j) * n`  
- `X_j` = number of recursive calls during `phase j`
- Running time of `RSelect` ≤ `Σ (X_j · c · ((3/4)^j)n)`
