import sys
sys.setrecursionlimit(3000)

# Recursive Knapsack Algorithm implementation

weight = [0]
value = [0]
solns = {}

def knapsack(file_path):
    total_cap = 0
    items = 0

    # Initialize file and map values and weights
    with open(file_path) as f:
        for index, line in enumerate(f):
            values = [int(x) for x in line.split(' ')]
            if index == 0:
                total_cap = values[0]
                items = values[1]
            else:
                value.append(values[0])
                weight.append(values[1])

    return k_recursive(items, total_cap)

def k_recursive(i, x):
    # Check cache first
    if (i, x) in solns:
        return solns[(i, x)]

    # Base case
    if i == 1:
        solution = value[i] if x >= weight[i] else 0
        solns[(i, x)] = solution
        return solution

    if x >= weight[i]:
        # Find max of case 1 and case 2
        case_1 = k_recursive(i - 1, x)
        case_2 = k_recursive(i - 1, x - weight[i]) + value[i]

        solution = max(case_1, case_2)
        solns[(i, x)] = solution
        return solution
    else:
        case_1 = k_recursive(i - 1, x)

        solns[(i, x)] = case_1
        return case_1
