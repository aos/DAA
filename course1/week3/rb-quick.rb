def quicksort(arr, s = 0, e = arr.length)
  return if e - s <= 1

  p_i = partition(arr, s, e)
  # Recurse on left of pivot
  quicksort(arr, s, p_i)
  # Recurse on right of pivot
  quicksort(arr, p_i + 1, e)
end

# Pivot = end of array
def partition(arr, start, e)
  pivot = arr[e - 1]
  p_index = i = start
  
  while i < e - 1
    if arr[i] < pivot
      arr[i], arr[p_index] = arr[p_index], arr[i]
      p_index += 1
    end
    i += 1
  end
  arr[p_index], arr[e - 1] = arr[e - 1], arr[p_index]
  p_index
end

arr = [5, 3, 9, 7, 2, 8]
quicksort(arr)
p arr
