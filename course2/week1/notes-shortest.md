# Shortest Paths

## Goal: Compute `dist(v)`, the fewest # of edges on a path from `s` to `v`

## Extra code:
```
- Initialize dist(v)
  - 0, if v = s
  - +∞, if v ≠ s

- When considering edge (v,w):
  - If w unexplored, then set dist(w) = dist(v) + 1
```

