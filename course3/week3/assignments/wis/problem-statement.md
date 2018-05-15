# Weighted Independent Sets in Path Graphs

## Problem Statement

**Input**: A path graph `G = (V, E)` with nonnegative weights on vertices

**Desired output**: Subset of nonadjacent vertices - an **independent set** --
of maximum total weight

### A Greedy Approach

- (**Not correct**) Iteratively chose the max-weight vertex not adjacent to any
  previously chosen vertex

### A Divide & Conquer Approach

- (**Not correct**) Recursively compute the max-weight IS of 1st half, ditto for
  2nd half, then combine the solutions

- **Problem**: What if recursive sub-solutions conflict? Not clear how to
  quickly fix

## Reason the Optimal Substructure

**Critical step**: Reason about structure of an optimal solution (in terms of
optimal solutions of smaller subproblems)

**Motivation** This thought experiment narrows down the set of candidates for
the optimal solution; can search through the small set using brute-force search

**Notation**:
- Let `S ⊆ V` be a max-weight independent set (IS)
- Let `v_n` be last vertex of path

### A Case Analysis

**Case 1**: Suppose `v_n ∉ S`. Let `G'` = `G` with `v_n` deleted  
- (Note: `S` also an IS of `G'`)
- (Note: `S` must be a max-weight IS of `G'` - if `S*` was better, it would also
    be better than `S` in `G` [contradiction])

## Toward an Algorithm

**Upshot**: A max weight IS *must be* either:
1. a max-weight IS of `G'` or...
2. `v_n` + a max-weight IS of `G''`

**Corollary**: if *we knew* whether or not `v_n` was in the max-weight IS, could
recursively compute the max-weight IS of `G'` or `G''` and be done

**Crazy(?) Idea**: Try both possibilities and return the better solution
