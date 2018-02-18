# H34PS
> Supported operations
> 1. Insertion
> 2. Extraction
> 3. (Heapify)
> 4. (Delete)

## Introduction
A container for objects that have keys
  - Ex: employee records (SSNs?), network edges (key: weight)

## Operations:
### Insertion
Add a new object to a heap
- Running time: `O(log n)`

### Extract-Min (or Extract-Max)
Remove an object in heap with a minimum key valus. (Ties broken arbitrarily)
- Running time: `O(log n)` [n = # of objects in heap]

### (Heapify)
`n` batched `Inserts`
- Running time: `O(n)`

### (Delete)
Delete an element from the middle of a heap
- Running time `O(log n)`

## Applications:
**Canonical use of heap**: Fast way to do *repeated minimum computations*.
(Example: selection sort)

### Heap sort:
1. Insert all `n` array elements into a heap
2. Extract-min to pluck out elements in sorted order
- Running time: `O(n log n)`
- Optimal for a *comparison-based* sorting algorithm!

### Event manager (priority queue):
Example: simulation (eg. for a video game)
- Objects = event records (action/update to occur at given time in the future)
- Key = time event scheduled to occur
- Extract-min ⇒ yields the next scheduled event

### Median Maintenance
**Received**: A sequence of `x` numbers, one-by-one.  
**Output**: At each time step `i`, the median of `x`.  
**Constraint**: Use `O(log i)` time at each step `i`.  
**Solution**: Maintain 2 heaps:
- `H_low`: supports *Extract-Max* -- smallest half of numbers
- `H_high`: supports *Extract-Min* -- largest half of numbers  
**Key idea**: Maintain invariant that ~~ 1/2 smallest (largest) elements in 
`H_low` (`H_high`)
- Rebalance: *Extract-Max* from `H_low` or *Extract-Min* from `H_high` and
  insert into the other heap

### Speeding up Dijkstra
- Naive implementation ⇒ runtime `O(nm)`, where `n: # vertices` and `m: # edges`  
  `n` also # of loop iterations, `m` also work per iteration (linear scan edges)
- With heaps ⇒ runtime `O(m log n)`
