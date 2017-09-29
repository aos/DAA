const fs = require('fs');
const swap = (array, i, j) => [array[i], array[j]] = [array[j], array[i]] 
const median = (a, b, c) => {
  let arr = [a, b, c].sort();
  return arr[1]; }

const quickSort = (array, l = 0, r = array.length) => {

  if ((r - l) <= 1) return 0;
  
  // Number of comparisons made
  let comp = r - l - 1;
  const pIndex = partition(array, l, r);
  comp += quickSort(array, l, pIndex);
  comp += quickSort(array, pIndex + 1, r);

  return comp;
}

// Assume pivot is at end of array
const partition = (array, l, r) => {
  let i = j = l,
      partValue = array[r - 1];

  while (j < r - 1) {
    if (array[j] < partValue) {
      swap(array, i, j);
      i++;
    } 
    j++;
  }
  swap(array, i, r - 1);
  return i;
}

// arr = [10, 8, 2, 5, 1, 4, 9, 6];
// quickSort(arr);
// console.log(arr);

const arrTwo = [];
fs.readFileSync('../week3/TextArray.txt', 'utf-8').split('\n').forEach(x => { if (parseInt(x)) { arrTwo.push(parseInt(x)) } });
const comp = quickSort(arrTwo);
console.log(arrTwo, comp);
