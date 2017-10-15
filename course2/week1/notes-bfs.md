# Breadth-first search (BFS)
- Explore nodes in "layers"
- Can compute shortest paths
- Connected components of undirect graph

> Run-time: `O(m + n)` time

## Implementation
```
BFS(graph G, start vertex s):
[All nodes initially unexplored]

- Mark s as explored
- let Q = queue data structure, initialized with s
- While Q ≠ 0:
  - remove first node of Q, call it v
  - for each edge (v, w):
    - if w unexplored
      - mark w as explored
      - add w to Q (at the end)
```
