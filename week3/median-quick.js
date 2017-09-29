// Median-of-3 partitioning
const fs = require('fs');
const swap = (array, i, j) => [array[i], array[j]] = [array[j], array[i]] 
const findMedian = (...arr) => {
  const newArr = arr.sort((a, b) => a - b);
  return newArr[Math.floor((newArr.length - 1) / 2)]; }

const quickSort = (array, l = 0, r = array.length - 1) => {

  if ((r - l) <= 1) return 0;
  
  // Number of comparisons made
  let comp = r - l;
  const pIndex = partition(array, l, r);

  if (l < pIndex) {
    comp += quickSort(array, l, pIndex - 1);
  }
  if (r > pIndex) {
    comp += quickSort(array, pIndex + 1, r);
  }

  return comp;
}

// Median-of-Three pivot 
const partition = (array, l, r) => {
  let i = l,
      j = r,
      mid = array[Math.floor((r - l) / 2)],
      partValue = findMedian(array[l], array[r], mid);

  while (i <= j) {
    while (array[i] < partValue) {
      i++;
    }
    while (array[j] > partValue) {
      j--;
    }
    if (i <= j) {
      swap(array, i, j);
      i++;
      j--;
    }
  }
  return i;
}

// arr = [10, 8, 2, 5, 1, 4, 9, 6];
// quickSort(arr);
// console.log(arr);

const arrTwo = [];
fs.readFileSync('../week3/TextArray.txt', 'utf-8').split('\n').forEach(x => { if (parseInt(x)) { arrTwo.push(parseInt(x)) } });
const comp = quickSort(arrTwo);
console.log(arrTwo, comp);
