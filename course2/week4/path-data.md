# Pathological Data Sets -- Universal Hashing

## The Load of a Hash Table

**Definition**: The `load factor` of a hash table is:  
```
    # of objects
α = ------------
    # of buckets
```
For load factors larger than 1 -- you require `separate chaining`

**Note**:
1. `α = O(1)` is necessary condition for operations to run in constant time
2. With open addressing, need `α << 1`

**Upshots**:  
For good HT performance:
1. *Need to control load*.
2. *Need a good hash function* (spreads data across buckets evenly)

**Ideal**: User super-clever hash function guaranteed to spread every data set
out evenly.

**Problem**: Does not exist. for every hash function, there is a pathological
data set.

**Reason**: Fix a hash function `h:U → { 0, 1, 2, ..., n - 1 }`  
⇒ a la Pigeonhole Principle, ∃ bucket `i` such that at least `|U|/n` elements of
`U` hash to `i` under `h`

## Pathological Data in the Real World

**Reference**: Crosby and Wallach, USENIX 2003  
**Main Point**: Can paralyze several real-world systems  
(Eg., network intrusion detection) by exploiting badly designed hash functions  
- Open source
- Overly simplistic hash function  
  (Easy to reverse engineer a pathological data set)

## Solutions
1. Use a cryptographic hash function (eg. SHA-2)  
   - Infeasible to reverse engineer a pathological data set
2. Use **randomization**
   - Design a *family* `F` of hash functions such that, ∀ data sets `S`, "almost all" `h ∈ F` spread `S` out "pretty evenly".  
   (Compare to quicksort guarantee)
