# Prefix-free codes

## Binary Codes
- Maps each character of alphabet `Σ` to a binary string
- **Example**: `Σ = a - z` & various punctuation (size 32, overall)
- Obvious encoding: Use the 32 `5-bit` binary strings to encode this `Σ` (fixed
    length code)
- Can we do better? **Yes**, if some characters are much more frequent than
    others, using a variable-length code

## Ambiguity
- **Example**: Suppose `Σ = { A, B, C, D }`. Fixed-length encoding would be: `{
    00, 01, 10, 11}`.
- Suppose instead, we use the encoding `{ 0, 01, 10, 1 }`. What about the
    message `001`. What is this decoded to? Could be `AB` or `AAD`.

## Prefix-Free Codes
- **Problem**: With variable-length codes, not clear where one character ends +
    the next one begins.
- **Solution**: *Prefix-free codes* - make sure that for every pair `i, j ∈ Σ`,
    neither of the encoding `f(i), f(j)` is a prefix of the other
- **Example**: `{ 0, 10, 110, 111 }`

## Example
Assuming frequency of appearance:
| `Σ` | frequencies | fixed-length | variable-length |
| --- | :---------: | -----------: | --------------: |
| A   | 60%         | 00           | 0               |
| B   | 25%         | 01           | 10              |
| C   | 10%         | 10           | 110             |
| D   | 5%          | 11           | 111             |

- **fixed-length encoding**: 2 bits / character
- **variable-length encoding**: 1.55 bits / character

### Computional Problem
Which variable-length code gives us the minimum average coding length of a
symbol?
