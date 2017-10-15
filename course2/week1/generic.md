# Generic Graph Search

## Generic Algorithm (Given graph `G`, vertex `s`)
```
- Initially s explored, all other vertices unexplored
- While possible:
  - Choose an edge (u, v) with
    u explored and v unexplored
    - If none, halt
  - Mark v explored 
```

## BFS vs DFS

### Breadth-first search (BFS)
> `O(m + n)` time using a queue
- Explore nodes in "layers"
- Can compute shortest paths
- Can compute connected components of an undirect graph

### Depth-first search (DFS) 
> `O(m + n)` time using a stack
- Explore aggresively like a maze, backtrack only when necessary
- Compute topological ordering of directe acyclic graphs
- Compute connected components in direct graphs
