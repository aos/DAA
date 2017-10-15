# Depth-First Search (DFS)
- Explore aggressively, only backtrack when necessary  
  - Such as exploring a maze
- Also computes a toplogical ordering of a directed acyclic graph
- And strongly connected components of directed graphs

## The code (recursive):
```
DFS(graph, start)
- Mark s as explored
- for every edge (s, v):
  - if v unexplored
    - DFS(graph, v) <- Recurse on v
```
