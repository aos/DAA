# Dijkstra's Algorithm Implementation Using a Heap

## Heap operations overview
Performs `insert`, `extract-min` in `O(log n)` time
- Note: Also requires ability to `delete` from middle of heap

## Two Invariants

### Invariant #1:
Elements in heap = vertices in `V-X`

### Invariant #2:
For `v ∉ X` (still in the heap), key[v] = smallest Dijkstra's greedy score of an
edge `(u, v) ∈ E` with `v ∈ X`

By maintaining these invariants, `extract-min` yields correct vertex `w*` to add
to `X` next. And we set `A[w*]` to `key[w*]`

## Maintaining the Invariants (specifically #2)
By pulling an item from the heap using `extract-min`, the key of the newly
extracted vertex must be updated because of new crossing edges.

```
Pseudocode:

When w extracted from heap (ie., added to x)
- For each edge (w, v) ∈ E:
  - If v ∈ V - x (ie., still in heap)
    - Delete v from heap
    - Recompute key[v] = min( key[v], A[v] + l_wv )
    - Re-insert v into heap
```

## Running Time Analysis
Dominated by heap operations (`O(log n)` each)
- (n - 1) `extract-mins`
- each edge `(v, w)` triggers at most one `Delete/Insert` combo (if `v` added
  to `x` first)
