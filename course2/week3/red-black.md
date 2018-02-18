# Red-Black Trees
The running time of all properties of search trees is the height

## Balanced Search Trees
**Idea**: Ensure that height always `O(log n)` [best possible]
- Search/insert/delete/min/max/pred/succ will then run in `O(log n)` time (`n` = #
    of keys in tree)

## Red-Black Invariants
1. Each node `red` or `black`
2. `root` is `black`
3. No 2 `red`s in a row: [red node => only black children]
4. Every path from `root` to `NULL` pointer, has same number of `black` nodes
   (like in an unsuccessful search)

## Example 1 (non-working)
**Claim**: A chain of length `3` cannot be a red-black tree  
**Proof**: If the tree is made of `black-red-black`, then invariant `4` is
broken. This is because if you search for `0`, you encounter only 1 black node.
Where as if you search for 4, you encounter 2 black nodes

## Example 2 (working)
**Claim**: A `3-5-7` tree is red-black  
**Proof**: All nodes are black

## Height Guarantee
**Claim**: Every red-black tree with `n` nodes has height ≤ `2log_2(n + 1)`  
**Proof**: observation: if every `root`-`NULL` path has ≥ `k` nodes, then tree
includes a perfectly balanced search tree of depth `k - 1`

**Note**: size `n` of tree must be at least `2^k - 1`, where `k` = minimum # of
nodes on `root`-`NULL` path, `k` ≤ `log_2(n + 1)`

**Thus**: In a red-black tree with `n` nodes, there is a `root`-`NULL` path with
at most `log_2(n + 1)` black nodes

**By 4th Invariant**: Every `root`-`NULL` path has ≤ `log_2(n + 1)` black nodes  
**By 3rd Invariant**: Every `root`-`NULL` path has ≤ `2log_2(n + 1)` total nodes

