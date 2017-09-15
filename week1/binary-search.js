// Requires a sorted array as input
const binarySearch = (array, value) => {
  let high = array.length - 1,
      low = 0;

  while (low <= high) {
    const mid = Math.floor((low + high) / 2);

    if (value > array[mid]) {
      low = mid + 1;
    }
    else if (value < array[mid]) {
      high = mid - 1; 
    }
    else {
      return true;
    }
  }

  return false; 
}

console.log(binarySearch([1, 2, 3, 4, 5], 4));
