#  Kruskal's Implementation using Union-Find

**Pseudocode**:
```
- sort edges in order of increasing order   → O(m log n)
  [rename edges 1, 2, 3, ..., m so that c1 < c2 < ... < cm]
- T = 0
- for i = 1 to m                    → O(m) iterations
  - if T ∪ { i } has no cycles      → O(n) time to check for cycle (BFS or DFS)
    - add i to T
- return T
```

### Running time of straightforward implementation:
> `m = # of edges, n = # of vertices`

**Running time**: `O(m log n) + O(mn) = O(mn)`  
**Plan**: Data structure for `O(1)` time for cycle checks!

## Union-Find Data Structure

**Raison d'etre**: Maintain a partition of a set of objects

### Operations:

**Find(x)**: Return name of *group* that `x` belongs to

**Union(C_i, C_j)**: Fuse groups `C_i` and `C_j` into a single one

**Why is this useful for Kruskal's?** objects = vertices  
- Groups = connected components with respect to currently chosen edges `T`
- Adding new edge `(u, v)` to `T` <->  fusing connected components into  one
