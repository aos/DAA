# A Dynamic Programming Algorithm

### Step 1: Recurrence:
**Notation**: Let `V_i,x` = value of the best solution on that:
1. Uses only the first `i` items
2. Has total size `<= x`

Subproblems now have 2 different ways in which they get smaller: one less item
and less capacity. We need to now keep track of how many items and what's the
total size we are allowed to use.

**Cases**:
- Case 1: `n ∉ S` (`S` is the optimal solution)
- Case 2: `n ∈ S`

Our recurrence
```
For i ∈ {1, 2, ..., n} and any x:
  V_i,x = max { (V_(i-1),x), (V_i + (V_(i-1),x-w_i)) }
                    Case 1              Case 2
                item i excluded     item i included
```

**Edge case**: If `w_i > x`, must have `V_i,x = V_(i-1),x`. Forced to use Case 1

### Step 2: Identify the subproblems
- All possible prefixes of items `{ 1, 2, ..., i }`
- All possible (integral) residual capacities `x ∈ { 0, 1, 2, ... w }`

### Step 3: Use recurrence from step 1 to systematically solve all subproblems
```
Let A = 2-D array
- Initialize A[0, x] = 0 for x = 0, 1, 2, ..., W
- For i = 1, 2, 3, ... n:
  - For x = 0, 1, 2, 3, ... w:
    - If w_i > x, then A[i, x] := A[i-1, x]
    - A[i, x] := max { A[i-1, x], A[i-1, x-w_i] + v_i }
Return A[n, W]
```

This will compute the value of the optimal solution (returns a number), not the
actual subset of items. Trace backwards for reconstruction process.

**Reconstruction**: Start with the optimal solution, then move backwards
checking to see if we used **case 1** or **case 2**.
- Case 1: did we inherit the solution one column to the left corresponding to
    not taking the item? (`A[i-1, x]`). If value is `0`, then item is not added
    to reconstruction as we do not have enough residual capacity
- Case 2: if not case 1, then we did take the item (added to the solution). Now
    trace back to the table, looking at one column to the left and # of columns
    down equal to the weight of this item (`A[i-1, x-w_i]`)
    - Now ask this exact same question on this item
