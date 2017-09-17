import math

def multiply(num_one, num_two):
    size_one = len(str(num_one))
    size_two = len(str(num_two))
    n = max(size_one, size_two)

    if (n == 1): 
        return num_one * num_two 

    # Left half of number
    num_one_left = math.floor(num_one / (10 ** (n / 2)))
    # Right half of number
    num_one_right = math.floor(num_one % (10 ** (n / 2)))

    # Left half of number 2
    num_two_left = math.floor(num_two / (10 ** (n / 2)))
    # Right half of number 2
    num_two_right = math.floor(num_two % (10 ** (n / 2)))

    product_one = multiply(num_one_left, num_two_left)
    product_two = multiply(num_one_right, num_two_right)
    product_three = multiply(num_one_left + num_one_right,
                            num_two_left + num_two_right)

    return product_one * 10 ** n + (product_three - product_one - product_two) * 10 ** (n / 2) + product_two

print(multiply(5211986647570828172548043773141856795012425179839383045438476733, 4606712684935304570646997185447986666259678494439329643332680432))
