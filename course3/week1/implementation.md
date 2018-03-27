# Prim's Implementation

Pseudocode:
```
- initialize X = [s]          # s ∈ V chosen arbitrarily
- T = 0                       # Invariant: X = vertices spanned by tree so far
- while X != V:
  - let e = (u, v) be the cheapest edge of G with u ∈ X, v ∉ X
  - add e to T
  - add v to X
```

**Running time of straight forward implementation**:
- `O(n)` iterations (where n = # of iterations) ← per vertex
- `O(m)` time per iteration (where m = # of edges) ← per edge of vertex
⇒ `O(mn)`

## Using heaps to speed up Prim's
- Raison d'etre of a heap is to speed up repeated minimum computations
- **Natural idea**: Use a heap to store edges, with keys = edge costs

## Prim's Algorithm with Heaps
**Invariant #1**: Elements in heap = vertices of `V - X`  
**Invariant #2**: For `v ∈ V - X`, key[v] = cheapest edge `(u, v)` with `u ∈ X`

## Idea
Use heaps to store edges, with keys = edge costs
