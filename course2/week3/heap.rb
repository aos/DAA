class MinHeap

  def initialize
    @nodes = []
  end
  
  def insert(n)
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
      while @nodes[ins_i] < @nodes[parent(ins_i)] 
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
    # larger than its parent(s)
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


  # Swap elements in array
  def swap(p_i, c_i)
    @nodes[p_i], @nodes[c_i] = @nodes[c_i], @nodes[p_i]
  end

end
