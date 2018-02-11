# Balanced Binary Search Trees
> Think of them like dynamic sorted arrays!

## Sorted Array Supported Operations
1. Search (binary search) => `O(log n)`
2. Select (given order statistic `i`) => `O(1)`
3. Min/Max => `O(1)`
4. Predecessor and Successor => `O(1)`
   - Ex. Start at 15th element, where is next?
5. Rank => `O(log n)`
   - Ie. How many keys less than or equal to given value?
6. Output in sorted order => `O(n)`

Unfortunately, `insertions` and `deletions` are usually linear time in a sorted
array. ***But***, in a balanced binary search tree we have logarithmic time.

## Balanced Search Tree Operations
1. Search => `O(log n)`
2. Select => `O(log n)`
3. Min/Max => `O(log n)`
4. Pred/Succ => `O(log n)`
5. Rank => `O(log n)`
6. Output in sorted order => `O(n)`
7. Insert/Delete => `O(log n)`

# Implementation
Most basic version:
- Each node has: **left** child pointer, **right** child pointer, **parent**
  pointer

## Search Tree Property
> Assuming `x` is parent node
#### 1. All keys in the left subtree are less than `x`
#### 2. All keys in the right subtree are greater than `x`

### The Height of a BST
**Note**: Many possible trees for a set of keys  
**Note**: Height (longest root-leaft path)could be anywhere from `≈ log_2 n` 
          to `≈ n`

## Searching and Inserting
### To `search` for key `k` in tree `T`:
- Start at the root
- Traverse left/right child pointers as needed
   - If `k` < `key`, traverse left
   - If `k` > `key`, traverse right
- Return node with key `k` or `NULL`, as appropriate

### To `insert` a new key `k` in tree `T`:
- Search for `k` (unsuccessfully)
- Rewire final `NULL` pointer to point to new node with key `k`
