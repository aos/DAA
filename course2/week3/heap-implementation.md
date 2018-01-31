# The Heap Property

**Concept**: Heap as tree -- rooted, binary, as complete as possible  
(As complete as possible: the left most leaves are filled)

**Heap property**: 
- At every node `x`, `Key[x] ≤ all keys of x's children`
- The root is the minimum key value

## Array Implementation
1. Root at node `0`, index `0` of array
2. At level 1, the children of node `0`, indices `1-2` of array
3. etc.  
`[4, 4, 8, 9, 4, 12, 9, 11, 13]`

**Note**: 
To get the parent of each node (assuming not index `0`) in array:
```
parent(i) = ⌊(i - 1)/2⌋, if i.even?
            ⌊i/2⌋, if i.odd?
```

And children of `i` are `2i` (even), and `2i + 1` (odd).

### Implementation of Insert (given key `k`)
1. Stick `k` at end of last level
2. Bubble-up `k` until heap property is restored (Key of `k`'s parent is ≤ `k`)

**Check**: Bubbling up process must stop, with heap property restored

### Implementation of Extract-Min
1. Delete root
2. Move last leaf to be new root
3. Iteratively bubble-down until heap property is restored. (When picking a
   child node to swap with -- always swap with smaller child node)

**Check**: Only bubble-down once per level, halt with a heap
