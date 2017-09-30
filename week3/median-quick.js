// Median-of-3 partitioning
const fs = require('fs');
const swap = (array, i, j) => [array[i], array[j]] = [array[j], array[i]] 
const findMedian = (array, l, r, mid) => {
  if (array[l] > array[mid]) {
    swap(array, l, mid);
  }
  if (array[l] > array[r]) {
    swap(array, l, r);
  }
  if (array[mid] > array[r]) {
    swap(array, mid, r);
  }
  return mid; 
}

const quickSort = (array, l = 0, r = array.length - 1) => {

  if ((r - l) <= 0) return 0;
  
  // Number of comparisons made
  let comp = r - l;
  const pIndex = partition(array, l, r);

  comp += quickSort(array, l, pIndex - 1);
  comp += quickSort(array, pIndex + 1, r);

  return comp;
}

// Median-of-Three pivot 
const partition = (array, l, r) => {
  let i = j = l,
      mid = Math.floor((r + l) / 2),
      partIndex = findMedian(array, l, r, mid),
      partValue = array[partIndex];
  
  swap(array, partIndex, r);

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

arr = [10, 8, 2, 5, 1, 4, 9, 6, 30, 3, 11, 15, 21, 7];
// const comp = quickSort(arr);
// console.log(arr, comp);

const arrTwo = [];
fs.readFileSync('../week3/TextArray.txt', 'utf-8').split('\n').forEach(x => { if (parseInt(x)) { arrTwo.push(parseInt(x)) } });
const comp = quickSort(arrTwo);
console.log(arrTwo, comp);
