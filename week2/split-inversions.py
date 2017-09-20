from math import floor

def sort_count(array):

    n2 = floor(len(array) / 2)

    if len(array) == 1: 
        return array, 0

    else:
        b, x = sort_count(array[0:n2])
        c, y = sort_count(array[n2:])
        d, z = merge_count_split_inv(b, c)

    return d, x + y + z

def merge_count_split_inv(b, c):
    result = []
    i = 0
    j = 0
    count = 0

    while i < len(b) and j < len(c): 
        if b[i] <= c[j]:
            result.append(b[i])
            i += 1
        else:
            result.append(c[j])
            j += 1
            count += len(b) - i 

    while i < len(b):
        result.append(b[i])
        i += 1

    while j < len(c):
        result.append(c[j])
        j += 1

    return result, count

r, c = sort_count([9, 6, 5, 4, 3, 2])
print([9, 6, 5, 4, 3, 2], "=> Number of inversions:", c)
s, d = sort_count([5, 2, 3, 4, 6, 9])
print([5, 2, 3, 4, 6, 9], "=> Number of inversions:", d)
