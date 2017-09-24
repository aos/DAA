/** Recursive binary search
 *
 * T(n) = T(n/2) + O(n ^ 0)
 * (a = 1, b = 2, d = 0)
 * Running time: O(log n)
 *
 * Note: assume sorted array as input
*/

const binarySearch = (array, value, s = 0, e = array.length) => {
  const length = e - s;
  const mid = Math.floor((e + s) / 2);

  if (value == array[mid]) {
    return mid;
  }

  else if (value > array[mid] && length > 1) {
    return binarySearch(array, value, mid, e);
  }

  else if (value < array[mid] && length > 1) {
    return binarySearch(array, value, s, mid);
  }

  else {
    return false;
  }
}

console.log(binarySearch([1, 2, 3, 4, 5, 6, 7], 8));
