# Merge sort

> Recursive

Input: array of `n` numbers, unsorted

Output: same numbers, sorted in increasing order

- Take input array, split it in half
- Recurse until all arrays are sorted
- Merge them

### Pseudocode

```
Sort step:
- Recursively sort 1st half of input array
- Recursively sort 2nd half of input array

Merge step:

C = output array (length = n)
A = 1st sorted array (n/2)
B = 2nd sorted array
i = 1
j = 1

for k = 1 to n
  if A(i) < B(j)
    C(k) = A(i)
    i++
  else if B(j) < A(i)
    C(k) = B(j)
    j++
end
  (ignores end cases)
```

### Running Time

> Running time approximately equals # of lines of code executed?

Upshot: given an array of `n` numbers is <= `4n + 2` (according to pseudocode)

(At most `6m` since `m >= 1`)

Claim: merge sort requires: <= `6n log n + 6n` operations to sort n numbers

`log2 n` -> # of times you divide by 2 until you get down to 1

Total # of levels is `log2 n + 1`

- At a given level `j` (`j = 0, 1, 2, ... , log2 n`), there are `2^j` subproblems, each of size `n/(2^j)`

Total # of operations at level `j`:

<= `2^j * 6(n/(2^j)) = 6n` (independent of `j`!)
> This is because while the # of subproblems doubles per level, the amount of work done is divided by half

Total:
<= `6n * (log2 n + 1)`

`6n`: work per level, `log2 n + 1`: # of levels
