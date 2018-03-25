# A Scheduling Application - the Algorithm

## Intuition for Algorithm

**Recall**: Want to minimize the sum

**Goal**: Devise a correct greedy algorithm that solves this problem  

**Question**:
1. With equal lengths, schedule larger or smaller-weight jobs earlier?
2. With equal weights, schedule shorter or longer jobs earlier?

**Answer**: 
1. Larger-weight jobs earlier
2. Shorter jobs earlier

## Resolving Conflicting Advice

**Question**: What if `w_i > w_j` but `l_i > l_j`?

**Idea**: Assign "scores" to jobs that are:
- Increasing in weight (prefer larger weight)
- Decreasing in length (prefer small length)

**Guess 1**: Order jobs by decreasing value of `w_j - l_j` (difference)  
**Guess 2**: Order `(w_j)/(l_j)` (ratio)

## Breaking a Greedy Algorithm

To distinguish `1` and `2`: Find an example where the two algorithms produce
different outputs (at least one will be incorrect).

**Example**:
|              | Job 1 | Job 2 |
| -            | :---: | :---: |
| length (`l`) | 5     | 2     |
| weight (`w`) | 3     | 1     |

What is the sum of weighted completion times of algorithms `1` and `2`,
respectively?  
**Algorithm 1 (difference)**:
1. 3 - 5 = `-2`
2. 1 - 2 = `-1` - winner `Job 2`

**Algorithm 2 (ratio)**:
1. `3/5` - winner `Job 1`
2. `1/2`

Weight sum of completion times using algorithms:  
1. Algorithm 1
```
Job 2 -> Job 1
Completion times: 2 -> 7
Weighted sum: (1 * 2) + (3 * 7) = 2 + 21 = 23
```
2. Algorithm 2
```
Job 1 -> Job 2
Completion times: 5 -> 7
Weighted sum: (3 * 5) + (1 * 7) = 15 + 7 = 22
```

## Story So Far

Algorithm #1 not (always) correct. Algorithm #2 (ordering by ratio) is always
correct.
