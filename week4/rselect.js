/* Randomized selection algorithm in O(n) time
 *
 * Given an array of length n, find the i-th order statistic
 *
 * Example (i = 6, 6th smallest element in array)
*/

function rSelect(array, i, l = 0, r = array.length - 1) {

  // Safe-guard
  if (i === 0 || i > array.length) return -1;

  // Base case
  if ((r - l) == 0) return array[l];

  // Partition around a random pivot
  const pIndex = randomPartition(array, l, r);

  // And if we're lucky...!
  if (pIndex + 1 == i) return array[pIndex];
  // Return 1st part of array
  if (pIndex + 1 > i) return rSelect(array, i, l, pIndex + 1);
  // Return 2nd part of array
  if (pIndex + 1 < i) return rSelect(array, i, pIndex + 1, r);
}

/* Helper functions */
function randomPartition(array, l, r) {
  const i = getRandomInt(l, r);
  swap(array, i, r);
  return partition(array, l, r);
}

// Random integer, min/max inclusive 
function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Pivot index is last element of array
function partition(array, l, r) {
  let i = j = l,
      partValue = array[r];

  while (j < r) {
    if (array[j] < partValue) {
      swap(array, i, j);
      i++;
    } 
    j++;
  }
  swap(array, i, r);
  return i;
}

const swap = (array, i, j) => [array[i], array[j]] = [array[j], array[i]];

/* Test cases */
const arr = [19, 4, 3, 2, 1, 9, 6, 7, 15];
console.log(rSelect(arr, 5));
