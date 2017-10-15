# Application: Undirected Connectivity

`Let G = (V, E)` be an undirected graph

**Connected components** = the "pieces" of `G`

*Goal*: Compute all connected components  
*Why?*: Check if network is disconnected  
  - Graph visualization - clustering

## To compute all components (undirected case):
```
- Initialize all nodes as unexplored
  (assume labeled 1 to n)
- For i = 1 to n
  - if i not yet explored
    - BFS(G, i)

    [discovers precisely i's connected component]
```
