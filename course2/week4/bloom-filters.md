# Bloom Filters

## Supported Operations

**Raison d'être**: Super fast lookups, super fast insertions

## Comparison to hash tables:

**Pros**: More space efficient  
**Cons**:
1. Can't store an associated object
2. No deletions (for vanilla)
3. Small false positive probability  
(ie, might say `x` has been inserted even though it hasn't been)

## Applications

**Original**: Early spell-checkers

**Canonical**: List of forbidden passwords

**Modern**: Network routers
- Limited memory, need to be super fast

## Under the Hood

**Ingredients**:
1. Array of `n` bits  
So... `n/|S| = # of bits per object in data set S`
2. `k` hash functions, `h1, h2, ..., h_k` (`k` = small constant)

**Insert(x)**: 
```
for i = 1, 2, ..., k            (Whether or not bit already set to 1)
  set A[h_i(x)] = 1
```

**Lookup(x)**:
```
return TRUE <=> A[h_i(x)] = 1 for every i = 1, 2, ..., k
```

**Note**: no false negatives (if `x` was inserted, `lookup(x)` guaranteed to
succeed)  
**But**: false positive if all `k` `h_i(x)`'s already set to 1 by other insert
