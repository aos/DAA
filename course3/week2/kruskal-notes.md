# Kruskal's MST Algorithm

#### Pseudocode:
```
- sort edges in order of increasing order
  [rename edges 1, 2, 3, ..., m so that c1 < c2 < ... < cm]
- T = 0
- for i = 1 to m
  - if T ∪ { i } has no cycles        <<--- How to do this?
    - add i to T
- return T
```

### Correctness
**Theorem**: Kruskal's algorithm is correct

**Proof**: Let `T*` = output of Kruskal's algorithm on input graph `G`  
1. Clearly `T*` has no cycles
2. `T*` is connected
    - By *Empty Cut Lemma*, only need to show that `T*` crosses every cut
    - Fix a cut `(A, B)`. Since `G` connected at least one of its edges crosses
        `(A, B)`

**Key point**: Kruskal will include first edge crossing `(A, B)` that it sees

3. Every edge of `T*` justified by the **Cut Property** (implies `T*` is the MST)
    - Reason: Consider iteration where edge `(u, v)` added to correct set `T`
    - Since `T ∪ { (u, v) }` has no cycle, `T` has no `u-v` path
        - ∃ empty cut `(A, B)` separating `u` and `v`
        - By `2b`, no edges crossing `(A, B)` were previously considered
          Kruskal's algorithm
        - `(u, v)` is the first (& hence the cheapest) edge crossing `(A, B)`
        - `(u, v)` justfied by the **Cut Property**
