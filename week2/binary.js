/** Recursive binary search
 *
 * T(n) = T(n/2) + O(n ^ 0)
 * (a = 1, b = 2, d = 0)
 * Running time: O(log n)
 *
 * Note: assume sorted array as input
*/

const binarySearch = (array, value) => {
  const mid = Math.floor(array.length / 2)

  if (value == array[mid]) {
    return array[mid];
  }

  else if (value > array[mid] && array.length > 1) {
    return binarySearch(array.slice(mid), value);
  }

  else if (value < array[mid] && array.length > 1) {
    return binarySearch(array.slice(0, mid), value);
  }

  else {
    return false;
  }
}

console.log(binarySearch([1, 2, 3, 4, 5, 6, 7], 3));
