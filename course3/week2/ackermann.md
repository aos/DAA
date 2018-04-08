# Ackermann Function

## Tarjan's Bound for Union-Find

**Theorem**: With *union by rank* and *path compression*, `m Union+Find`
operations take `O(m α(n))` time, where α(n) is the **inverse Ackermann
function**.

## The Ackermann Function

Will define `A_k(r)` for all integers `k >= 0` and `r >= 1`

**Base case (`k = 0`)**: `A_0(r)` = `r + 1` for all `r >= 1`  
**In general**: 
```
for k, r >= 1:  
  A_k(r) = apply A_k-1 r times to r  
         = (A_k-1 ∘ A_k-1 ∘ ... ∘ A_k-1)(r)   # => r-fold composition
```

## The Inverse Ackermann Function

**Definition**: 
```
for every `n >= 4`:
  α(n) = minimum value of k such that A_k(2) >= 2
```
