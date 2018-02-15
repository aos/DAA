# Binary Search Trees (part deux)

## Other operations (Min, Max, Pred, and Succ)
> Worst-case running times:  
> `Min/Max`: `ϴ(height)`  
> `Pred/Succ`:  
> `In-Order Traversal`: `ϴ(n)`  
> `Deletion`: `ϴ(height)`  
> `Select/Rank`: `ϴ(height)`

### To compute the minimum key of a tree
- Start at root
- Follow left **childs** until a you hit `nil`
- Return last key found!

### To compute the maximum key of a tree
- Start at root
- Follow **right** childs until you hit `nil`
- Return last key found

### To compute the predecessor of key `k`
- Easy case:
   - If `k`'s left subtree is non-empty, return max key in left subtree (the
     right node)
- Otherwise: follow parent pointers until you get to a key less than `k`  
  (The first time we take a left turn, we'll see a key that is smaller)

### To compute successor of key `k`
- Use the algorithm for predecessor but flip directions

### In-Order Traversal
- Print out keys in increasing order  
```
- Let r = root of search tree, with
  - subtrees T_l and T_r
- Recurse on T_l
  - By recursion, print out keys of T_l in increasing order
- Print out root's key
- Recurse on T_r
  - By recursion, print out keys on T_r in increasing order
```

### Deletion
Search for `k`, then:
1. Easy case (`k` has no children): just delete `k`'s node from tree
2. Medium case (`k` has one child):  
    - Just "splice out" `k`'s node, unique child assumes position previously held
3. Hard case (`k` has 2 children):
    - Compute `k`'s predecessor `l`
        - [traverse `k`'s non-`NULL` left child pointer, then right child 
          pointers until no longer possible]
    - Swap `k` and `l`
    - Delete or splice out `k`'s new node

### Select and Rank
- Select: find `i`-th order statistic  
- Rank: find how many keys are less than or equal to key/value

*Idea*: Store a little bit of extra info at each tree node about the tree itself

Example augmentation: `size(x)` = number of # tree nodes in subtree rooted @ `x`  
**Note**: if `x` has children `y` and `z`, then `size(y)` + `size(z)` + 1 =
`size(x)`

#### Select (using augmented search tree with subtree sizes)
- Start at root `x`, with children `y` and `z`
- let `a = size(y)` [a = 0, if `x` has no left child]
- if `a = i - 1`, return `x`'s key
- if `a ≥ i`, recursively compute `i`-th order statistic of search tree rated at
  `y`
- if `a < i - 1`, recursively compute `(i - a - 1)`-th order statistic of search
  tree rated at `z`
