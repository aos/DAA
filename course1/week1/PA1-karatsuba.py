# Karatsuba multiplication
import math
import sys

def multiply(num_one, num_two):
    """
    Karatsuba multiplication

    Given a number of format: ab * cd
    Steps:
        1. Compute `ac`
        2. Compute `bd`
        3. Compute `(a + b)(b + d)`
        4. Compute (3) - (1) - (2)
        5. Result = (ac)^(n) + (3)^(n/2) + (bd)
    """
    str_one = str(num_one)
    str_two = str(num_two)
    size_one = len(str_one)
    size_two = len(str_two)
    n = max(size_one, size_two)

    if (n == 1): 
        return num_one * num_two 

    n2 = math.ceil(n / 2)

    # Left half of number
    num_one_left = int(str_one[:-n2] if str_one[:-n2] else '0')
    # Right half of number
    num_one_right = int(str_one[-n2:])

    # Left half of number 2
    num_two_left = int(str_two[:-n2] if str_two[:-n2] else '0')
    # Right half of number 2
    num_two_right = int(str_two[-n2:])
    
    product_one = multiply(num_one_left, num_two_left)
    product_two = multiply(num_one_right, num_two_right)
    product_three = multiply(num_one_left + num_one_right,
                            num_two_left + num_two_right)

    return (product_one * (10 ** (n2 * 2))) + ((product_three - product_one - product_two) * (10 ** n2)) + product_two

# Test cases
f = open(sys.argv[1])
for line in f:
    d = line.split()
    print("{0} * {1} =".format(d[0], d[1]), multiply(int(d[0]), int(d[1])))
