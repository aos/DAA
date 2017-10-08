# Guiding Principles

### #1

"Worst-case analysis": our running time
- Bound holds for every input of length `n`
- Particularly appropriate for "general purpose" routines

### #2

Won't pay much attention to constant factors, lower-order terms.

Justifications:
1. Way easier
2. Constants depend on architecture/compiler/programmer
3. Lose very little predicitve power

### #3

Asymptotic analysis: focus on running time for large input sizes `n`

Ex: `6n * log2 n + 6n` "better than" `(1/2)n^2`

Justification: only big problems are interesting!

### Fast algorithm = worst-case running time grows slowly with input size
