## `O(n log n)` Algorithm for Closest Pair

### High-Level Approach

We can piggy-back on merge sort here to take advantage of its running time.

1. Make copies of points sorted by x-coordinate (P_x) and by y-coordinate (P_y)
2. Use **divide** and **conquer**

```
ClosestPair(P_x, P_y):

(Base case: 2 - 3 points, use brute force search to calculate closest pair)

1. let Q = left half of P
       R = right half of P

Form Q_x, Q_y, R_x, R_y (takes O(n) time)

2. (p_1, q_1) = ClosestPair(Q_x, Q_y) // Closest pair on left
3. (p_2, q_2) = ClosestPair(R_x, R_y) // Closest pair on right
4. let delta = min{d(p_1, q_1), d(p_2, q_2)}
5. (p_3, q_3) = ClosestSplitPair(P_x, P_y, delta)
6. Return best of (p_1, q_1), (p_2, q_2), (p_3, q_3)
```

Requirements:
1. `O(n)` time
2. Correct whenever closest pair of P is a split pair

```
ClosestSplitPair(P_x, P_y, delta):

let x_bar = biggest x-coordinate in left of P
let S_y = points of P with x-coordinate in:
          [ (x_bar - delta), (x_bar + delta) ], sorted by y-coordinate

Initialize:
best = delta, best_pair = null

For i = 1 to |S_y| - 1
  For j = 1 to min{7, |S_y| - 1} // This is constant time, because of 7
    let p_1q = i_th, (i + j)_th points of S_y
    if d(p, q) < best
      best_pair = (p, q), best = d(p, q)

Return best_pair
```

#### Correctness Claim
Claim: let `p` in `Q`, `q` in `R` be a split pair with `d(p, q) < delta`

Then: 
A. `p` and `q` are members of `S_y`
B. `p` and `q` are at most `7` positions apart in `S_y`

##### Corollary 1:
If the closest pair of `P` is a split pair, then `ClosestSplitPair` finds it.

##### Corollary 2:
`ClosestPair` is correct, and runs in `O(n log n)` time.
