# Strongly Connected Components (SCC)

- A graph is strongly connected if it is possible to get from one point into any other point along a directed graph

**Formal Definition**: The strongly connected components of a directed graph `G` are the equivalence (`~`) classes of the relation:  
```
u ~ v <=> ∃ path u ⇒ v
              and
          a path v ⇒ u in G
```

# Kosaraju's Two-Pass Algorithm
**Theorem**: Can compute the SCCs in `O(m+n)` time

**Algorithm**:  (Given directed graph `G`)
1. Let `G_rev` = `G` with all arcs reversed
2. Run DFS-Loop on `G_rev` 
    - *goal*: compute the "magical ordering" of nodes
    - Let `f(v)` = "finishing time" of each v ∈ V
3. Run DFS-Loop on `G`
    - *goal*: discover the SCCs one-by-one
    - Processing nodes in decreasing order of finishing times

* `[SCCs = nodes with the same "leader"]`

> `DFS-Loop` is a version of `DFS` which makes sure that all vertices are seen.  
An outer loop that runs through each vertex, and if it has not been explored  
already, run `DFS` on it.
