# Lazy Union Implementation

Each object `x ∈ X` has a **parent** field

**Invariant**: Parent pointers include a collection of directed trees on `X`  
(If `x` is root, `parent[x] = x`)

**Initially**: For all `x`, `parent[x] := x`

**Find(x)**: Traverse parent pointers from `x` until you hit the root

**Union(x, y)**: `s_1 := Find(x), s_2 := Find(y)`, reset parent of one of `s_1,
s_2` to be the other

## Union by Rank

**Ranks**: For each `x ∈ X`, maintain field `rank[x]`

**Invariant (for now)**: For all `x ∈ X`, `rank[x]` = maximum # of hops from
some leaf *to* `x`. (Initially, `rank[x] = 0` for all `x ∈ X`)

**To avoid scraggly trees ("Union by Rank")**:  
Install the shallow tree (having lower rank), under the deeper tree (having
higher rank):
```
given x & y:
- s_1 = Find(x), s_2 = Find(y)
- if rank[s_1] > rank[s_2]
    then parent[s_2] = s_1
- else parent[s_1] = s_2
```
