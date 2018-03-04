# Algorithm Design Paradigms

#### Divide and Conquer
- Merge sort

#### Randomized Algorithms
- Quicksort (random pivot)
- Randomized hash functions

#### Greedy Algorithms
- Dijkstra's shortest path (!)

#### Dynamic Programming

---

# Greedy Algorithms

**Definition**: Iteratively make "myopic" decisions, hope everything works out
in the end

**Example**: Dijkstra's shortest path
-processed each destination once, irrevocably

### Contrast with divide & conquer
1. Easy to propose multiple greedy algorithms for many problems
2. Easy running time analysis (contrast to master method)
3. Hard to establish correctness (contrast to straightforward induction)

**DANGER**: Most greedy algorithms are ***NOT*** correct

**Example**: Dijkstra's algorithm with negative edge lengths

# Proofs of Correctness

## Method 1: Induction
- "Greedy stays ahead"
- **Example**: Correctness of proof for Dijkstra's algorithm

## Method 2: "Exchange argument"

## Method 3: Whatever works!
