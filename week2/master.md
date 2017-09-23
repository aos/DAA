# The Master Method

## Recurrence Format

1. Base case: `T(n) <= a constant` for all sufficiently small `n`
2. For all larger `n`:
    - `T(n) <= aT(n/b) + O(n ^ d)`, where (independent of `n`)
      - `a` = number of recursive calls
      - `b` = input size shrinkage factor
      - `d` = exponent in running time of "combine step" `(>= 0)`

## Master Method cases:
```
             O(n^d log n)       if a = b^d (Case 1)
      T(n) = O(n^d)             if a < b^d (Case 2) 
             O(n^(log_b a))     if a > b^d (Case 3)
```
