# Minimum Spanning Trees

## Overview

**Goal**: Connect a bunch of points together as cheaply as possible

**Applications**: Clustering, networking

**Algorithms**:
1. Prim's Algorithm [1957; also Dijkstra 1959, Jarnik 1930]
2. Kruskal's Algorithm [1956]

**Time complexity**: `O(m log n)`  
`m` → # of edges  
`n` → # of vertices  
(Using suitable data structures)

## Problem Definition

**Input**: *Undirected* graph `G = (V, E)` and a cost `C_e` for each edge `e ∈ E`
- Assume adjacency list representation
- Ok if edge costs are negative

**Output**: Minimum cost tree `T ⊆ E` that spans all vertices  
`cost`: Sum of edge costs

**I.e.**: 
1. `T` has no cycles
2. The subgraph (V, T) is connected → contains path between each pair of
   vertices (spans all vertices)

## Standing Assumptions

**Assumption #1**: Input graph `G` is connected
- Else no spanning trees
- Easy to check in preprocessing (eg, DFS)

**Assumption #2**: Edge costs are distinct
- Prim & Kruskal remain correct with ties (which can be broken arbitrarily)
- Correctness proof a bit more annoying
