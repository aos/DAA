/*
 * Week 1 - Programming Assignment #1
 *
 * Implement one or more of the integer multiplication algorithms:
 * a. Recursive integer multiplication
 *    - Input: two `n`-digit numbers
 *    - Output: the product `x * y`
 * b. Karatsuba's algorithm
*/

function integerMult(numOne, numTwo) {
  const numOneLength = numOne.toString().length,
        numTwoLength = numTwo.toString().length;

  if (numTwo === 0) return 0;

  let multiplier = numTwo % 10,
      result = numOne * multiplier * (10 ** (numOneLength - numTwoLength));

  const nextNum = Math.floor(numTwo / 10);

  return result + integerMult(numOne, nextNum);
}

console.log(integerMult(5211986647570828172548043773141856795012425179839383045438476733, 4606712684935304570646997185447986666259678494439329643332680432));
