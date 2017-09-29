const fs = require('fs');
const swap = (array, i, j) => [array[i], array[j]] = [array[j], array[i]] 

const quickSort = (array, l = 0, r = array.length) => {

  if ((r - l) <= 1) return;

  const pIndex = partition(array, l, r);
  quickSort(array, l, pIndex);
  quickSort(array, pIndex + 1, r);

  return array;
}

// Assume pivot is at beginning of array
const partition = (array, l, r) => {
  let i = l,
      j = l + 1,
      partValue = array[l];

  while (j < r) {
    if (array[j] < partValue) {
      i++;
      swap(array, i, j);
    } 
    j++;
  }
  swap(array, i, l);
  return i;
}

arr = [10, 8, 2, 5, 1, 4, 9, 6];
quickSort(arr);
console.log(arr);

// const arrTwo = [];
// fs.readFileSync('../week2/TestIntegerArray.txt', 'utf-8').split('\n').forEach(x => arrTwo.push(parseInt(x)));
// quickSort(arrTwo);
// console.log(arrTwo);
