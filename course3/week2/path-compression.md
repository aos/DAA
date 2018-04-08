# Path Compression

**Idea**: Why bother traversing a leaf-root path multiple times?

**Path compression**: After `Find(x)`, install shortcuts (ie. rewire parent
pointers) to `x`'s root all along the `x ∼ root` path

**In array representation**: 
```
If invoking Find(1), do path compression on tree 
(Update 1 and 4's parent to be 7)

 1  2  3  4  5  6  7     1  2  3  4  5  6  7
[4, 5, 5, 6, 7, 7, 7] ⇒ [7, 5, 5, 7, 7, 7, 7]
```
