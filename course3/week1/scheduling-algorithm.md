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
```
l_1 = 5       l_2 = 2
w_1 = 3       w_2 = 1
```
What is the sum of weighted completion times of algorithms `1` and `2`,
respectively?
