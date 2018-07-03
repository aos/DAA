# Iterative Knapsack Algorithm implementation

def knapsack(file_path):
    solution = []
    total_cap = 0
    items = 0

    # Open file
    with open(file_path) as f:
        # Outer loop to gather items
        for index, line in enumerate(f):
            values = [int(x) for x in line.split(' ')]
            if index == 0:
                total_cap = values[0]
                items = values[1]
                # Initialize 0 for 0th item
                column = [0 for r in range(total_cap + 1)]
                solution.append(column)
            else:
                value = values[0]
                weight = values[1]
                column = []
                solution.append(column)

                # Inner loop for item weights
                for cap in range(0, total_cap + 1):
                    column.append(cap)
                    case_1 = solution[index - 1][cap]
                    if weight > cap:
                        solution[index][cap] = case_1
                    else:
                        case_2 = solution[index - 1][cap - weight] + value
                        solution[index][cap] = max(case_1, case_2)

    return solution[items][total_cap]
