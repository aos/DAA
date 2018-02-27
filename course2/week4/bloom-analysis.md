# Bloom Filters (cont'd)

## Heuristic Analysis

**Intuition**: Should be a trade-off between space and error (false positive)
probability

**Assume**: [not justified] all `h_i(x)`'s uniformly random and independent
(across different `i`'s and `x`'s)

**Setup**: `n` bits, insert data set `S` into bloom filter  
**Note**: For each bit of `A`, the probability that it's been set to `1` after a
data set `S` has been inserted is:  
```
1 - (1 - (1 / n))^(k * |S|)

Also,

1 - e^(-k / b)  <- b = # of bits per objects (n/|S|)
```

**So**: Under assumption, for `x ∉ S`, false positive probability is ≤ `[1 -
e^(-k/b)]^k` (error rate `ε`), where `b` = # of bits per object

**How to set `k`?**: For fixed `b`, `ε` is minimized by setting `k ≈ (ln 2) * b`  
**Plugging back in**: `ε ≈ (1/2)^((ln 2) * b)` or `b ≈ 1.44 * log_2(1/ε)`

**Example**: With `b = 8`, choose `k = 5 or 6`, error probability only ≈ `2%`
