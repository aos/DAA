# Principles of Dynamic Programming

## Key ingredients of dynamic programming
1. Identify a **small** number of subproblems
2. Can quickly + correctly solve "larger" subproblems given the solutions to
   "smaller" subproblems  
   (usually via a recurrence such as `A[i] = max { A[i - 1], A[i - 2] + w_i }`)
3. After solving all subproblems, can quickly compute the final soluction  
   (usually, it's just the answer to the "biggest" subproblem)
