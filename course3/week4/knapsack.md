# The Knapsack Problem

## Definition

**Input**: `n` items. Each has a value:
- value `v_i` (non-negative)
- size `w_i` (non-negative and integral)
- capacity `W` (non-negative integer)

**Output**: a subset `S ⊆ { 1, 2, 3, ..., n }` that maximizes the sum of values
(`v_i`) such that the sum of sizes (`w_i`) is less than or equal to capacity
(`W`)

## Developing a Dynamic Programming Algorithm

### Step 1:
Formulate a recurrence (optimal solution as function of solutions to "smaller"
subproblems) based on structure of an optimal solution
- `let S = a max-value solution to an instance of knapsack`

**Case 1**: Suppose item `n ∉ S`
- `S` must be optimal with the first (`n - 1`) items (Same capacity `W`)  
  (if `S*` were better than `S` with respect to 1st (`n - 1`) items, then this
  equally true with respect to all `n` items - contradiction)

**Case 2**: Suppose item `n ∈ S`.
- Then `S - { n }` is an optimal solution with respect to the 1st (`n - 1`)
items and residual capacity `W - w_n`
- **Proof**: if `S*` has higher value than `S - { n }` + total size ≤ `W - w_n`,
  then `S* ∪ { n }` has size ≤ `W` and value more than `S`
