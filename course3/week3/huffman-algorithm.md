# Huffman Greedy Algorithm

## Building a Tree
- **Natural but suboptimal**: top-down / divide & conquer
- Partition `Σ` into `Σ_1`, `Σ_2` each with ≈50% of total frequency
- Recursively compute `T_1` for `Σ_1`, `T_2` for `Σ_2`, return tree

- **Huffman's (optimal) idea:**:
- Build tree *bottom-up*
- Using successive mergers

## A Greedy Approach
- **Question**: Which pair of symbols is "safe" to merge?
- **Observation**: Final encoding length of `i ∈ Σ` = # of mergers its subtree
    endures

## How to Recurse?
- **Suppose**: 1st iteration of algorithm merges symbols `a` & `b` (lowest
    frequencies)
- **Idea**: replace the symbols `a, b` by a new "meta-symbol" `ab`
- **Question**: What should be the frequency `p_ab` of this new meta-symbol? The
    sum of the frequencies of the two symbols: `p_a + p_b`

## Huffman's Algorithm
Given frequencies `p_i` as input:
```
If |Σ| = 2, return a-0-N-1-b binary tree
Let a,b ∈ Σ have the smallest frequencies
Let Σ` = Σ with a,b replaced by new symbol ab
Define p_ab = p_a + p_b
Recursively compute T` (for the alphabet Σ`)
Extend T` (with leaves ↔ Σ`) to a tree T with leaves ↔ Σ
  by splitting leaf ab into two leaves a & b 
Return T
```

## Implementation and Running Time
- Because we're doing repeated minimum computations (by getting the lowest
    frequencies), use a **heap**.
    - **Key** = frequency
- After extracting the two smallest frequency symbols, re-insert the new
    meta-symbol [new key = sum of the 2 old ones]
- **Iterative**, running in `O(n log n)` time
