# Union-Find Basics

**Idea #1**:  
- Maintain one linked structure per connected component of `(V, T)`
- Each component has an arbitraty **leader** vertex

**Invariant**: Each vertex points to the leader of its component  
[ "Name" of a component inherited from leader vertex ]

**Key point**: Given edge `(u, v)`, can check if `u` and `v` already in same
component in `O(1)` time *[**iff** ⇒ leader pointers of `u, v` match]*

## Operations

**Find(x)**: Return name of *group* that `x` belongs to

**Union(x, y)**: Given that `x` belongs `C_i` and `y` belongs to `C_j`, fuse the
respective groups

## Maintaining the Invariant

**Note**: When new edge `(u, v)` added to `T`, connected components of `u & v`,
merge.

**Idea #2**: When two components merge, have smaller one inherit the leader of
the larger one. (Easy to maintain a size field in each component to facilitate
this.)

### Updating Leader Pointers

**But**: How many times does a single vertex have its leader pointer update over
the course of Kruskal's algorithm? `O(log n)`

**Reason**: Every time `v`'s leader pointer gets updated, population of its
component at least doubles.  
⇒ Can only happen <= `log_2 n`

### Running Time of Fast Implementation

- Sort: `O(m log n)` time for sorting
- Cycle checks: `O(m)` time, `O(1)` per iteration
- `O(n log n)` time overall for leader pointer updates
- **Total**: `O(m log n)`
