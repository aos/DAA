/** Recursive binary search
 *
 * T(n) = T(n/2) + O(n ^ 0)
 * (a = 1, b = 2, d = 0)
 * Running time: O(log n)
 *
 * Note: assume sorted array as input
*/
const fs = require('fs');

const binarySearch = (array, value, s = 0, e = array.length) => {
  const mid = Math.floor((e + s) / 2);

  if (s >= e) {
    return -1;
  }

  if (value > array[mid]) {
    return binarySearch(array, value, mid + 1, e);
  }

  if (value < array[mid]) {
    return binarySearch(array, value, s, mid - 1);
  }

  return mid;
}

const arr = [];
fs.readFileSync('TestIntegerArray.txt', 'utf-8').split("\n").forEach(x => arr.push(parseInt(x)));

console.log(arr);
