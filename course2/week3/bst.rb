class BinarySearchTree
  class Node
    # Requires implementing 'each' method
    include Enumerable
    # Requires implementing '<=>' method
    include Comparable

    attr_reader :val
    attr_accessor :left, :right, :size, :parent

    def initialize(val, parent)
      @val = val
      @parent = parent
      @size = 0
    end

    def full?
      left && right
    end

    def empty?
      left.nil? && right.nil?
    end

    def each(&block)
      left.each(&block) if left
      block.call(self)
      right.each(&block) if right
    end

    def remove_left
      remove_instance_variable(:@left)
    end

    def remove_right
      remove_instance_variable(:@right)
    end

    def remove_parent
      remove_instance_variable(:@parent)
    end

    def <=>(other_node)
      self.val <=> other_node.val
    end

    def to_s
      "Node with value: #{@val}"
    end
  end

  def initialize
    @root = nil
  end

  def insert(*val)
    # If passed an array or more than one argument, add them all
    # On first call, root does not have a parent and is thus not assigned
    val.flatten.each do |a| 
      insert_helper(@root, a) { |v| @root = v }
    end
  end

  def search(val)
    current = @root
    while current
      return current if current.val == val
      current = current.right if val > current.val
      current = current.left if val < current.val
    end
    nil
  end

  def delete(val)
    current = search(val)
    return if current.nil?

    # Easy case - no children
    if current.empty?
      p = current.parent
      p.remove_left if p > current
      p.remove_right if p < current
      return true
    # Hard - 2 children
    elsif current.full?
      pred = predecessor(current.val) 
      # Get current's parent
      parent = current.parent
      current.remove_parent
      pred.remove_parent
      # Assign current's parent to be the predecessor (for swapping)
      parent = pred
      # Point the parent's left/right node to the predecessor
      parent.left = pred if parent > pred
      parent.right = pred if parent < pred
      return true
    # Medium - 1 child 
    else
      parent = current.parent
      current.remove_parent
      child = nil
      if current.left
        child = current.left
        current.remove_left
      else
        child = current.right
        current.remove_right
      end
      child.remove_parent
      parent.right = child if current > parent
      parent.left = child if current < parent
      return true
    end
  end

  # Define min/max methods
  { min: :left, max: :right }.each do |k, v|
    define_method k do
      current = @root
      while current
        return current if current.send(v).nil?
        current = current.send(v)
      end
    end
  end

  # Defines predecessor/successor methods
  # For example: 
  # Lookup direction for pred starts on left, then goes right
  # Predecessor < parent
  lookup_dirs = { 
      predecessor: [:left, :right, :<], 
      successor: [:right, :left, :>] 
  }
  lookup_dirs.each do |k, v|
    define_method k do |val|
      current = search(val)
      return if current.nil?

      if current.send(v[0])
        current = current.send(v[0])
        while current
          return current if current.send(v[1]).nil?
          current = current.send(v[1])
        end
      else
        while current
          return nil if current.parent.nil?
          return current.parent if current.parent.send(v[2], current)
          current = current.parent
        end
      end
    end
  end

  def in_order_traversal(r = @root)
    in_order_helper!(r)
  end

  private

  def in_order_helper!(node)
    return [] unless node
    in_order_helper!(node.left) + [node.val] + in_order_helper!(node.right)
  end

  def insert_helper(rt, val, p = nil)
    # If root is nil, then assign the value to a new Node 
    if rt.nil?
      yield Node.new(val, p)
    else
      # Otherwise perform the recursive call, passing a block that 
      # adds the new node to the correct side of the parent
      # Also assigns the parent for each node
      case
      when val < rt.val
        rt.size += 1
        insert_helper(rt.left, val, rt) { |v| rt.left = v }
      when val > rt.val
        rt.size += 1
        insert_helper(rt.right, val, rt) { |v| rt.right = v }
      else
        raise 'Duplicate insertion!'
      end
    end
  end
end
