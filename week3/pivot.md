## The Importance of the Pivot

- Running time of QuickSort depends on the quality of the pivot chosen

- If pivot is always the first element of an array, the running time  
of the algorithm on an input array that is already sorted is `O(n^2)`
    - Reason: The partition subroutine does nothing
    - The recursive calls will be split very unevenly, with one  
    call taking in `n - 1` elements, and the other one taking `0`

- Best case scenario in which the pivot element is always the  
  median element of its subarray: `O(n log n)`

## Random Pivots

In every recursive call, choose the pivot *randomly*.

**Intuition**: 
1. If always get a 25-75 split, good enough for `O(n log n)` 
running time. 
2. Half of elements give a 25-75 split or better

## Average Running Time of QuickSort

**Quicksort Theorem**: For every input array of length `n`,  
the _average_ running time of Quicksort (with random pivots) is `O(n log n)`

Note: Holds for *every* input (no assumptions on data)
