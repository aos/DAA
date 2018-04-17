# MSTs: Application to Clustering

## Clustering

**Informal goal**: Given `n` "points" (web pages, images, genome fragments,
etc.) classify into "coherent groups" (aka *unsupervised learning*)

**Assumptions**:
1. As input, given a (dis)similarity measure -- a **distance** `d(p,q)` between
   each point pair
2. Symmetric (ie. `d(p,q) = d(q,p)`)

**Examples**: Euclidean distance, genome similarity, etc

**Goal**: Same cluster ⇒ "nearby"

## Max-Spacing k-Clusterings

**Assume**: We know `k = # of clusters` desired  
(in practice, can experiment with a range of values)

Call points `p` & `q` *separated* if they're assigned to different clusters.

**Definition** The **spacing** of a k-clustering (the closest pair of
separated points):
```
   min
separated d(p,q)            (the bigger, the better)
   p,q
```

**Problem statement**: Given a distance measure `d` and `k`, compute the
k-clustering with maximum spacing

## A Greedy Algorithm

Pseudocode:
```
- initially, each point in a separate cluster
- repeat until only k clusters:
  - let p, q = closest pair of separated points
    (determines the current spacing)
  - merge the clusters containing p & q into a single cluster
```

**Note**: Just like Kruskal's MST algorithm, but stopped early
- points ⇔ vertices
- distances ⇔ edge costs
- point pairs ⇔ edges

Called **Single-Link Clustering**
