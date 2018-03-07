# A Scheduling Problem

**Setup**: One shared resource (eg. a processor), many jobs to do a process  
**Question**: In what order should we sequence the jobs?  
**Assume**: Each job `j` has a:
- weight `w_j` (priority)
- length `l_j`

## Completion Times

**Definition**: The *completion time* `C_j` of job `j` = sum of job lengths up
to and including `j`

**Example**: 3 jobs, `l_1 = 1`, `l_2 = 2`, `l_3 = 3`  
**Question**: What is `C_1`, `C_2`, `C_3`? `1, 3, 6`

## The Objective Function

**Goal**: Minimize the weighted sum of completion times:
```
min (^n, _j = 1)∑ (w_j)(C_j)
```

**Back to example**: Sum is `(3 * 1) + (2 * 3) + (1 * 6) = 15`
