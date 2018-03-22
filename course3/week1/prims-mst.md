# Prim's MST Algorithm

## Pseudocode
```
- initialize X = [s]    # s ∈ V chosen arbitrarily
- T = 0                 # Invariant: X = vertices spanned by tree-so-far T
- while X != V:
  - let e = (u, v) be the cheapest edge of G with u ∈ X, v ∉ X
  - add e to T
  - add v to X
  (increase # of spanned vertices in cheapest way possible)
```

## Correctness of Prim's Algorithm

**Theorem**: Prim's algorithm always computes an MST

**Part 1**: Computes a spanning tree `T*`  
**Part 2**: `T*` is an MST (using the "cut property")

## Correctness of Prim's (part deux)

**Theorem**: Prim's algorithm always outputs a minimum-cost spanning tree

**Key question**: When is it "safe" to include an edge in the tree-so-far

### The Cut Property

Consider an edge `e` of `G`. Suppose there is a cut `(A, B)` such that `e` is
the cheapest edge of `G` that crosses it. Then `e` belongs to the MST of `G`.

**Cut property implies correctness**: every edge `e ∈ T*` is explicitly
justified by the cut property!  
⇒ `T*` is a subset of the MST  
⇒ Since `T*` is already a spanning tree, it must be the *MST*
