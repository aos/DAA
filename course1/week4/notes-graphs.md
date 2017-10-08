# Graphs
> Represents pair-wise relationships among a set of objects

## Two ingredients
1. **Vertices** aka *nodes* `V`
2. **Edges** `E` = pairs of vertices  
    - Can be *undirected* (unordered pair)
    - Or *directed* (ordered pair)

### Examples:
1. Road networks
2. The web (directed)
3. Social networks
4. Precedence constraints (Class pre-requisites)

## Cuts of Graphs
**Definition**: A *cut* of a graph `(V, E)` is a partition of `V` into two non-empty sets `A` and `B`

**Definition**: the *crossing edges* of a cut `(A, B)` are those with:  
- One endpoint in each of `(A, B)` (undirected)
- Tail in `A`, head in `B` (directeds)

## The Minimum Cut Problem
**Input**: An undirected graph `G = (V, E)`  
(Parallel edges allowed)  

**Goal**: Compute a cut with fewest number of crossing edges. (a *min cut*)

### Applications:
- Identify weaknesses/bottlenecks in a network
- Community detection in social networks  
  - Small regions which are highly connected amongst themselves,  
    but weakly connected to everyone else
- Image segmentation  
  - Input = graph of pixels
  - Use edge weights:   
    - `(U, V)` has large weight ↔ "expect" `U, V` to come from same object
