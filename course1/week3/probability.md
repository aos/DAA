# Probability Review I

## Concept #1 - Sample Spaces - "All Possible Outcomes" - Ω

- Each outcome `i ∈ Ω` has a *probability* `p(i) ≥ 0`
- **Constraint**: Σ p(i) = `1`

### Example 1: Rolling 2 dice
```
Ω = {(1,1), (2, 1), (3, 1), ..., (5, 6), (6, 6)}
```
36 ordered pair:
`p(i) = 1/36 for all i ∈ Ω`

### Example 2: Choosing a random pivot in outer Quicksort call

```
Ω = {1, 2, ..., n} (index of pivot) and p(i) = 1/n for all i ∈ Ω
```

## Concept #2 - Events

- An event is a subset `S ⊆ Ω`
- The *probability of an event* `S` is Σ p(i)

## Concept #3 - Random Variables

- A *random variable* `X` is a real-valued function  
`X: Ω ⇒ R`

### Example 1: Sum of the two dice
### Example 2: Size of subarray passed to 1st recursive call

## Concept #4 - Expectation

`let X: Ω ⇒ R` be a random variable
- The **expectation** `E[X]` (expected value) of `X` = average value of `X`  
`Σ X(i) · p(i)`

## Concept #5 - Linearity of Expectation
**Claim [LIN EXP]**: `let X₁, ..., Xn` be random variables defined on Ω.

## Example: Load Balancing
*Problem*: Need to assign `n` processes to `n` servers
*Proposed solution*: Assign each process to a random server
*Question*: What is expected number of processes assigned to a server?

### Solution:
Sample space `Ω` = all `n^n` assignments of processes to servers, each equally likely

Let `Y` = total number of processes assigned to first server

*Goal*: Compute `E[Y]`

## Concept #6 - Conditional Probability
`Let X, Y ∈ Ω` be events

- Then Pr[X | Y] ("X given Y") = `Pr[X ∩ Y] / Pr[Y]`
- The portion of Y filled with X ⇒ `X ∩ Y` 

## Concept #7 - Independence (of Events)
**Definition**: Events `X, Y ⊆ Ω` are *independent* if (and only if) `Pr[X ∩ Y] = Pr[X] · Pr[Y]`

### Independence (of Random Variables)
**Definition**: Random variables `A, B` (both defined on `Ω`) are *independent*.  
The events Pr[A = a], Pr[B = b] are independent for all a, b.
