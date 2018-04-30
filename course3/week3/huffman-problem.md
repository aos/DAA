# Huffman Codes - Problem Definition

## Codes as Binary Trees
- **Goal**: Best binary prefix-free encoding for a given set of character
    frequencies
- **Useful facts**: binary codes ↔ binary trees
- **Examples**: `Σ = { A, B, C, D }`

## Prefix-Free Codes as Trees
- **In general**: Left child edges ↔ `0`, right child edges ↔ `1`
- for each `i ∈ Σ`, exactly one node labeled `i`
- encoding of `i ∈ Σ` ↔ bits along path from root to the node `i`
- prefix-free ↔ labeled nodes = the leaves (since prefixes ↔ one node an
    ancestory of another)

**To decode**: repeatedly follow path from root until you hit a leaf  
**Note**: Encoding length of `i ∈ Σ = depth of i` in tree

## Problem Definition

- **Input**: Probability `p_i` for each character `i ∈ Σ`
- **Notation**: if `T = tree with leaves ↔ symbols of Σ`,
                then `L(T) = Σ p_i * (depth of i in T)`
- `L(T)` = average encoding length
- **Example**: if `p_A` = 60%, `p_B` = 25%, `p_C` = 10%, `p_D` = 5%, then `L =
    1.55`
- **Output**: a binary tree `T` minimizing the average encoding length `L(T)`
