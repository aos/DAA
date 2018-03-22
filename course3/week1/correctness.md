# Correctness Proof

**Claim**: Algorithm #2 (order jobs according to decreasing ratios `w_j/l_j`) is
always correct

**Proof**: By an `Exchange Argument`

**Plan**: Fix arbitrary input of `n` jobs, will proceed by contradiction.  
Let `σ = greedy schedule`, `σ* = optimal schedule`  
Will produce schedule even better than `σ*`, contradicting purported optimality
of `σ*`.

**Assume**: All `(w_j)/(l_j)`'s distinct  
**Assume**: [Just by renaming jobs] 
```
(w_1)/(l_1) > (w_2)/(l_2) > ... > (w_n)/(l_n)
```

**Thus**: Greedy schedule `σ` is just `1, 2, 3, ..., n`  
**Thus**: If optimal schedule `σ* != σ`, then there are consecutive jobs `i, j`
with `i > j`. [Only schedule where indices always go up is `1, 2, 3, ..., n`]  

**Thought experiment**: Suppose we *exchange* order of `i & j` in `σ*` (leaving
other jobs unchanged)

## Cost-Benefit Analysis

1. The effect of this exchange on the completion time of a job `k` other than `i` or `j` is unaffected.
2. Completion time of job `i` goes up (by length of `j`)
3. Completion time of job `j` goes down (by length of `i`)

**Upshots**:
1. Cost of exchange `w_i * l_j`
2. Benefit of exchange is `w_j * l_i`
