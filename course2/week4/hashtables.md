# Hash Tables

## Supported Operations

**Purpose**: Maintain a (possibly evolving) set of stuff  
(Ex: transactions, people + associated data, IP addresses, etc.)

1. **Insert** - Add new record

2. **Delete** - Delete existing record

3. **Lookup** - Check for particular record

All using a "key".  
All operations run in constant time `O(1)` (properly implemented, with
non-pathological data).

## Applications

### De-duplication

**Given**: A "stream" of objects  
- linear scan through a huge file
- Objects arriving in real time

**Goal**: Remove duplicates (i.e., keep track of unique objects)
- eg. report unique visitors to a website
- avoid duplicates in search results

**Solution**:  
When new object `x` arrives:
- Lookup `x` in hash table `H`
- If not found, insert `x` into `H`

### The 2-SUM problem

**Input**: Unsorted array `A` of `n` integers that sum to target `T`

**Goal**: Determine whether or not there are two numbers `x, y` in `A` with `x +
y = T`

**Naive solution**: `O(n^2)` time via exhaustive search
**Better**:
1. Sort `A` (`O(n log n)` time)
2. For each `x` in `A`, look for `T - x` in `A` via binary search (`O(n log n)`)

**Amazing**:  
1. Insert elements of `A` into hash table `H`
2. For each `x` in `A`, lookup `T - x` in `H` --> (`O(n)` time)

### Further Immediate Applications
- Historical applications: symbol tables in compilers
- Blocking network traffic
- Search algorithms (eg. game tree exploration)
    - Use hash table to avoid exploring any configuration more than once
    - Eg. arrangement of chess pieces
