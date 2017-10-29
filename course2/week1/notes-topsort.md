# Topological Sort

**Definition**: A *topological ordering* of a directed graph `G` is labeling `f` of `G`'s nodes such that:
1. All edges go in one direction
2. The `f(v)` are the set {1, 2, ..., n}
3. `(u, v) ∈ G ⇒ f(u) < f(v)`

**Motivation**: Sequence tasks while respecting all precedence constraints

**Note**: `G` cannot have a directed cycle  
No directed cycles ⇒ topological ordering

## Straightforward solution
**Note**: Every directed acyclic graph has a **sink** vertex.  
(The vertex that has no outgoing arcs)

**Reason**: If not, it is possible to keep following outgoing arcs until you hit a directed cycle

**To compute topological ordering**:
```
- Let v be a sink vertex of G
- Set f(v) = n
- Recurse on G-{v}
```

## Topological Sort via DFS
```
DFS(graph G, start vertex s)
- Mark s explored
- For every edge (s, v):
  - If v not yet explored:
    - DFS(G, v)
- Set f(s) = current_label
- current_label -= 1
```

```
DFS-Loop(graph G)
- Mark all nodes unexplored
- current_label = n (to keep track of ordering)
- For each vertex v ∈ G:
  - if v not yet explored
    - DFS(G, v)
```
