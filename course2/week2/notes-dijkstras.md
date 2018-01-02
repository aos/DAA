# Dijkstra's algorithm (pseudocode and implementation)

> Solves the single-source shortest path
> A close cousin of BFS

```
Initialize:
  - s -> source vertex
  - X = { s } (vertices processed so far)
  - V = {} (vertices not processed)
  - A[s] = 0 (computed shortest path distances)
  - B[s] = empty path (computed shortest paths) -- for explanation only

Main Loop:                    (Need to grow X by one node)
  - While X ≠ V:
    - among all edges (v, w) ∈ E with v ∈ X, w ∉ X:
      - pick the one that minimizes A[v] + l(v*w*)  <-- Dijkstra's greedy score
        - call it (v*, w*)
      - add w* to X
      - set A[w*] := A[v*] + l(v*w*)
      - set B[w*] := B[v*] ∪ (v*, w*)
```

### Running time: `ϴ(mn)`
* `m` = number of vertices
* `n` = number of edges

# Using heaps instead:
> Raison d'etre of heap -> perform insert, extract-min in `O(log n)` time
* Heap property: at every node, key ≤ children's keys
* Extract-min by swapping up last leaf, bubbling down
* Insert via bubbling up

## Two invariants:
* **Invariant #1**: Elements in heap = vertices in V-X
* **Invariant #2**: For ∀ v ∉ X, key[v] = smallest Dijkstra's greedy score of an
edge (u, v) ∈ E with u ∈ X

* Point: By invariants, `extract-min` yiels correct vertex w* to add to X next
* Set A[w*] to key[w*]

## Pseudocode
> When w extracted from heap*
```
- For each edge (w, v) ∈ E:
  - if v ∈ V-X (ie, heap)
    - delete v from heap
    - recompute key[v] = min{ key[v], A[w] + l(wv) }
    - re-insert v into heap
```
