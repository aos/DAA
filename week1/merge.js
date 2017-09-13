// Merge sort implementation in JS
const sort = (array) => {

  // Base case
  if (array.length <= 1) {
    return array;
  }
  
  const mid = Math.floor(array.length / 2);
  const left = array.slice(0, mid);
  const right = array.slice(mid);

  return merge(sort(left), sort(right));
}

const merge = (left, right) => {
  let il = 0, ir = 0;
  const result = [];

  // Merge
  while (il < left.length && ir < right.length) {
    if (left[il] < right[ir]) {
      result.push(left[il]);
      il++;
    }
    else {
      result.push(right[ir]);
      ir++;
    }
  }

  // End cases
  while (il < left.length) {
    result.push(left[il]);
    il++;
  }
  while (ir < right.length) {
    result.push(right[ir]);
    ir++;
  }

  return result;
}

console.log(sort([5, 234, 3, 3, 4, 30, 1, 9, 39]));
