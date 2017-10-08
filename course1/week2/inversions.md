## The Problem

**Input:** `arrayA` containing the numbers `1, 2, 3, ...` in some arbitrary order

**Output:** Number of *inversions* = number of pairs `(i, j)` of array indices with `i < j` and `A[i]` > `A[j]`

### Examples
`[1, 3, 5, 2, 4, 6]`

Inversions: `(3, 2), (5, 2), (5, 4)`

Motivation: Numerical similarity measure between two ranked lists.
The more inversions, the more different the lists.

> Eg. "collaborative filtering"

### High-level algorithm
```
Count(array A, length n)
  if n = 1 return 0
  else
    x = Count(1st half of A, n/2)
    y = Count(2nd half of A, n/2)
    z = CountSplitInv(A, n) // Currently unimplemented

  return x + y + z;
```

Goal: Implement `CountSplitInv` in linear time `O(n)`
Then total will run in `O(n log n)` time

### General Claim
**Claim:** The split inversions involving an element `y` of the 2nd array `C` are precisely the numbers left in the 1st array `B` when `y` is copied to the output `D`.

#### Proof:
> Let `x` be an element of the 1st array `B`
1. If `x` is copied to the output `D` before `y`, then `x < y` 
    - (no inversion involving `x & y`)
2. If `y` is copied to the output `D` before `x`, then `y < x` 
    - (`x` & `y` are a split inversion)

#### `Merge_and_CountSplitInv`
- While merging the two sorted subarrays, keep running total of number of split inversions
- When element of 2nd array `C` gets copied to output `D`, increment total by number of elements remaining in 1st array `B`
