# Hash Functions

**Note**: In hash table with chaining, `insert` is `O(1)`  
Insert new object `x` at front of list in `A[h(x)]`

`O(list length)` for `insert`/`delete` which could be anywhere from `m/n` to `m`
for `m` objects

**Point**: Performance depends on the choice of function  
(Analogous situation with open addressing)

### Properties of a "Good" Hash Function
1. Should lead to good performance ⇒ ie, should "spread data out"  
   (Gold standard: completely random hashing)
2. Should be easy to store & very fast to evaluate

### Bad Hash Functions
**Example**: keys = phone numbers (10 digits) `|U|` = 10^10 (choose `n` = 10^3)
- *Terrible* hash function: `h(x) = k + 3 digits of x` (area code)
- *Mediocre* hash function: `h(x) = last 3 digits of x`  
  (Still vulnerable to patterns in last 3 digits)

**Example**: Keys = memory locations (even, bytes -> multiples of power of 2)
- *Mediocre/bad* hash function: `h(x) = x mod 1000` (again `n` = 10^3)  
  ⇒ All odd buckets guaranteed to be empty

### Quick-and-Dirty Hash Functions

`[ objects U ]` - "hash code" → `[ integers ]` - "compression function" → 
`[ buckets ]`

- `hash code`: Subroutine to convert strings to integers
- `compression function`: Like the `mod u` function

### How to choose `n = # of buckets`
1. Choose `n` to be a prime (within constant factor of # of objects in table)  
   - No non-trivial factors shared with the data
2. Not too close to a power of 2
3. Not too close to a power of 10
