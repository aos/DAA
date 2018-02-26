# Universal Hash Functions

**Definitions**: Let `H` be a set of hash functions from `U` to `{ 0, 1, 2, ...,
n - 1}`  
`H` is *universal* if and only if:  
```
For all x, y ∈ U (with x != y)
Pr    [ x, y collide ] ≤ 1/n
h ∈ H [ h(x) = h(y)  ] (n = # of buckets) 
```
when `h` is chosen uniformly at random from `H`  
(ie, collision probability as small as with "gold standard" of perfectly random
hashing)

## Example: Hashing IP Addresses
Let `U` = IP addresses  
(of the form `[x1, x2, x3, x4]`, with each `x_i ∈ { 0, 1, 2, ..., 255 }`)

Let `n` = a prime (eg. small multiple of # of objects in HT)  
> Note: `n` should be double the number of objects you plan on storing to the
> nearest prime

**Construction**: Define one hash function `h_a` per 4-tuple `a = (a_1, a_2,
a_3, a_4)` with each `a_i ∈ { 0, 1, 2, 3, ..., n - 1 }`  
(`n^4` such functions)

**Define**: `h_a`:IP address → buckets  
```
h_a(x_1, x_2, x_3, x_4) = (a_1 * x_1 + a_2 * x_2)
                          (a_3 * x_3 + a_4 * x_4) mod n
```

**Theorem**: This family is universal.
