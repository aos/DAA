## Integer Multiplication

Input: two n-digit numbers `x` and `y`

Output: the product `x * y`

Assess the algorithm: 
The number of basic operations as a function of the input numbers

> "Perhaps the most important principle for the good 
algorithm designer is to refuse to be content."

Can we do better?


### Karatsuba Multiplication

Example:
```
x = 5678
y = 1234

a = (56)
b = (78)
c = (12)
d = (34)
```

1. Compute `a * c = 672`
2. Compute `b * d = 2652`
3. Compute `(a + b)(c + d) = 6164`
4. Compute `(3) - (2) - (1) = 2840`
5. Compute: 
    - Take product of first step, pad with 4 `0`s
    - Take product of second step and add to first
    - Take product of 4th step, pad with 3 `0`s and add to first + second
    ```
    6720000
       2652
     284000
    -------
    7006652
    ```

#### Recursive approach
Recall: `x * y = (10^n * ac) + (10^(n/2) * (ad + bc)) + bc`

Steps:
1. Recursively compute `ac`
2. Recursively compute `bd`
3. Recursively compute `(a + b)(c + d) = ac + ad + bc + bd`
4. Gauss's trick: (3) - (1) - (2) = `ad + bc`
