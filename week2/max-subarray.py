import math

def find_max_subarray(array, low, high):
    if low == high:
        return low, high, array[low]

    mid = math.floor((high + low) / 2)

    left_low, left_high, left_sum = find_max_subarray(array, low, mid)
    right_low, right_high, right_sum = find_max_subarray(array, mid + 1, high)
    cross_low, cross_high, cross_sum = find_max_crossing(array, low, mid, high)

    if left_sum >= right_sum and left_sum >= cross_sum:
        return left_low, left_high, left_sum
    elif right_sum >= left_sum and right_sum >= cross_sum:
        return right_low, right_high, right_sum
    else:
        return cross_low, cross_high, cross_sum

def find_max_crossing(array, low, mid, high):
    left_sum = -math.inf 
    max_left = 0
    total = 0

    for i in range(mid, low - 1, -1):
        total += array[i]
        if total > left_sum:
            left_sum = total
            max_left = i
    
    right_sum = -math.inf
    max_right = 0
    total = 0

    for j in range(mid + 1, high + 1):
        total += array[j]
        if total > right_sum:
            right_sum = total
            max_right = j

    return max_left, max_right, (left_sum + right_sum)

arr = [-3, 5, 3, -2]
print(find_max_subarray(arr, 0, len(arr) - 1))
