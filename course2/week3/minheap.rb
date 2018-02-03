# A min-heap is a rooted, binary, tree, as complete as possible

# All operations (insert, extract-min) must satisfy the heap property:
# Every node must be less than or equal to its children
# The root therefore contains the most minimum value
class MinHeap

  def initialize
    @nodes = []
  end
  
  def insert(key, value)
    n = Hash[key: key, value: value]
    # 1. Append to end
    @nodes << n
    # We need to keep track of inserted node's index
    # so that when we bubble up we adjust it and not keep
    # looking for it
    ins_i = size - 1
    
    # 2. Satisfy the heap property (bubble-up):
    # Move the newly inserted node up the tree as long as
    # it is smaller than its parent
    unless size == 1
      while @nodes[ins_i][:value] < @nodes[parent(ins_i)][:value]
        swap(parent(ins_i), ins_i)
        ins_i = parent(ins_i)
        break if ins_i == 0
      end
    end
    # Return the final index of the inserted element after re-ordering
    ins_i
  end

  def extract_min
    # 1. Extract root (guaranteed minimum value)
    root = @nodes.shift
    return root if empty? || size == 1

    # 2. Move last node to be new root
    @nodes.unshift(@nodes.pop)
    # Keep track of new root index so we can move it down
    new_r_i = 0
    
    # 3. Satisfy heap property (bubble-down):
    # Move the new root down the tree as long as it is
    # larger than its parent(s), making sure along the way
    # that we have not reached any terminating leaves
    while min_child(new_r_i) && 
          (@nodes[new_r_i][:value] > @nodes[min_child(new_r_i)][:value])
      temp_i = min_child(new_r_i)
      swap(new_r_i, temp_i)
      new_r_i = temp_i
      break unless new_r_i
    end
    root
  end

  def delete(k)
    # TODO: Implement this
  end

  def peek_min
    @nodes[0]
  end

  def heapsort_and_empty
    raise Exception, 'Insert values into heap before sorting' if empty?
    sorted = []
    
    until empty?
      sorted << extract_min
    end
    sorted
  end

  def size
    @nodes.length
  end

  def empty?
    @nodes.empty?
  end

  private

  # Get parent node index
  def parent(index)
    # Ruby automatically floors integers
    return (index - 1) / 2 if index.even?
    index / 2 
  end

  # Get the smaller child node index
  def min_child(index)
    ch_e = (index + 1) * 2
    ch_o = (index * 2) + 1

    if @nodes[ch_e] && @nodes[ch_o]
      @nodes[ch_e][:value] > @nodes[ch_o][:value] ? ch_o : ch_e
    elsif @nodes[ch_e]
      ch_e
    elsif @nodes[ch_o]
      ch_o
    else
      nil
    end
  end

  # Swap elements in array
  def swap(p_i, c_i)
    @nodes[p_i], @nodes[c_i] = @nodes[c_i], @nodes[p_i]
  end

end
