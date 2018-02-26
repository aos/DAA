# Open Addressing

**Recall**: One object per bucket, hash function produces a *probe sequence* for
each possible key `x`

**Fact**: Difficult to analyze rigorously

**Heuristic assumption**: All `n!` probe sequences equally likely

## Heuristic Analysis

**Observation**: Under heuristic assumption, expected `Insertion` time is `≈
1/(1 - α)`, where `α = load` 

Keep load under control, preferably less than 70%.

**Proof**: A random probe finds an empty slot with probability `1 - α`

**So**: `Insertion` time ≈ the number `N` of coin flips to get "heads", where
`Pr["heads"] = 1 - α`

**Note**: `E[N] = 1 (first coin flip) + α * E[N] (probability of tails)`  
**Solution**: `E[N] = 1/(1 - α)`

## Linear Probing

**Note**: Heuristic assumption completely false

**Assume instead**: Initial probe uniformly random, independent for different
keys

**Theorem**: [Knuth 1962] under above assumption, expected `Insertion` time is
`≈ 1/(1 - α)^2`, where `α = load`
