def sort(ary)
  len = ary.length
  return ary if len <= 1
    
  mid = len / 2
  left = ary[0, mid]
  right = ary[mid..-1]

  return merge(sort(left), sort(right))
end

def merge(left, right)
  li = 0
  ri = 0
  result = []

  while li < left.length && ri < right.length
    if left[li] < right[ri]
      result << left[li]
      li += 1
    else
      result << right[ri]
      ri += 1
    end
  end

  while li < left.length
    result << left[li]
    li += 1
  end

  while ri < right.length
    result << right[ri]
    ri += 1
  end

  result
end

p sort([8, 3, 4, 2, 1, 7, 9, 10])
