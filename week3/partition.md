## Partitioning Around a Pivot

**Key idea:** Partition array around a pivot element

- Pick element of array
- Rearrange array so that:
  - left of pivot => less than pivot
  - right of pivot => greater than pivot
- Pivot is now in the correct position in the array

### Cool facts about partitioning
1. Linear time `O(n)`, no extra memory
2. Reduces problem size (enables divide and conquer)
  - Recursively sort left and right partitions

### Pseudocode for QuickSort
```
QuickSort(array A, length n):
  if n = 1: return A
  p = ChoosePivot(A, n)
  Partition A around p
  Recursively sort 1st part: (0, p - 1)
  Recursively sort 2nd part: (p + 1, n)
```

### Pseudocode for Partition Subroutine
1. Pivot as first element
  - If not, swap pivot with 1st element as preprocessing step
```
Partition(A, l, r):     // Input: A[l, ..., r]
  p := A[l]
  i := l + 1
  for j = l + l to r:
    if A[j] < p:        // If A[j] > p, do nothing
      swap: A[j] and A[i]
      i := i + 1
  swap: A[l] and A[i - 1]
  return i
```
