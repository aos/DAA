# Chaining -- Constant-Time Guarantee

**Scenario**: Hash table implemented with chaining  
Hash function `h` chosen uniformly at random from universal family `H`

**Theorem**: [Carter-Wegman 1979]  
All operations run in `O(1)` time (for every data set `S`)

**Caveats**:
1. In expectation over random choice of the hash function `h`
2. Assumes `|S| = O(n)` [ie, load `α = (|S|/n) = O(1)`] (`n` = # of buckets)
3. Assumes takes `O(1)` time to evaluate hash function
