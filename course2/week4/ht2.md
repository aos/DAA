# High-Level Idea

**Setup**: Universe `U` [REALLY big]  
(eg. all IP addresses, all names, all chess board configurations, etc.)

**Goal**: Want to maintain evolving set `S ⊆ U` [Generally -- reasonably sized]

**Native solutions**:
1. Array-based solution (indexed by `U`) - `O(1)` operations but `O(|U|)` space
2. List-based solution `O(|S|)` space but `O(|S|)` lookup

**Solution**:  
1. Pick `n` = # of "buckets" with `n` ≈ `|S|`  
(For simplicity, assume `|S|` doesn't vary too much)
2. Choose a **hash function** `h:U -> [0, 1, 2, ..., n - 1]`
3. Use array `A` of length `n`, store `x` in `A[h(x)]`

## Resolving Collisions

**Collision**: Distinct `x, y ∈ U` such that `h(x) == h(y)`

**Solution #1**: (Separate chaining)
- Keep linked list in each bucket
- Given key/object `x`, perform `Insert/Delete/Lookup` in the list in `A[h(x)]`

**Solution #2**: Open addressing (only one object per bucket)
- Hash function now specifies probe *sequence* `h1(x), h2(x), ...`  
  (Keep trying til find open slot)
- Examples: linear probing (look consecutively), double hashing (use 2 hashes)
