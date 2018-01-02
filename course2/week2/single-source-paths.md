# Single-Source Shortest Paths

*Input:* Directed graph `G = (V, E)`. `(m = |E|, n = |V|)` ⇐ number of edges
and vertices  
- Each edge has *non-negative* length `l`
- Source vertex `s`

*Output:* for each `v ∈ V`, compute `l(v) := length of shortest 
source vertex (s-v) path in G`
> Length of path = sum of edge lengths

*Assumptions:*
1. (For convenience) ∀ `v` ∈ `V`, ∃ an `s` ~> `v` path
2. (Important) No negative edge lengths: `l ≥ 0, ∀ e ∈ E`

