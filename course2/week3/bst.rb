class BinarySearchTree
  class Node
    # Requires implementing 'each' method
    include Enumerable
    # Requires implementing '<=>' method
    include Comparable

    attr_accessor :left, :right, :size, :val

    def initialize(val)
      @val = val
      @size = 1
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
    @root = delete_helper(@root, Node.new(val))
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

  # Finding the predecessor works by two operations:
  # 1. Make the first left
  # 2. Keep going right after that
  def predecessor(val, r = @root)
    return nil if r.nil?

    if r.val >= val 
      return predecessor(val, r.left)
    else
      right = predecessor(val, r.right)
      return (right || r)
    end
  end

  # Finding the successor works by two operations:
  # 1. Make the first right down the tree
  # 2. Keep going left after that
  def successor(val, r = @root)
    return nil if r.nil?

    if r.val <= val
      return successor(val, r.right)
    else
      left = successor(val, r.left)
      return (left || r)
    end
  end

  def select(i, r = @root)
    select_helper(i, r)
  end

  # Retrieves data in sorted order
  def in_order_traversal(r = @root)
    in_order_helper(r)
  end

  def pre_order_traversal(r = @root)
    pre_order_helper(r)
  end

  def post_order_traversal(r = @root)
    post_order_helper(r)
  end

  private

  def select_helper(i, node)
    a = node.left ? node.left.size : 0 

    if i == a - 1
      return node
    elsif a >= i
      return select_helper(i, node.left)
    else
      i = i - a - 1
      return select_helper(i, node.right)
    end
  end

  def in_order_helper(node)
    return [] unless node
    in_order_helper(node.left) + [node.val] + in_order_helper(node.right)
  end

  def pre_order_helper(node)
    return [] unless node
    [node.val] + pre_order_helper(node.left) + pre_order_helper(node.right)
  end

  def post_order_helper(node)
    return [] unless node
    post_order_helper(node.left) + post_order_helper(node.right) + [node.val]
  end

  def insert_helper(rt, val)
    # If root is nil, then assign the value to a new Node 
    if rt.nil?
      yield Node.new(val)
    else
      # Otherwise perform the recursive call, passing a block that 
      # adds the new node to the correct side of the parent
      case
      when val < rt.val
        rt.size += 1
        insert_helper(rt.left, val) { |v| rt.left = v }
      when val > rt.val
        rt.size += 1
        insert_helper(rt.right, val) { |v| rt.right = v }
      else
        raise 'Duplicate insertion!'
      end
    end
  end

  # We are essentially recursing down the tree starting at the root
  # Once we find the node we want to delete we call the 'remove' method
  def delete_helper(tnode, node)
    if tnode == node
      tnode = remove(tnode)
    elsif node < tnode
      tnode.left = delete_helper(tnode.left, node)
    else
      tnode.right = delete_helper(tnode.right, node)
    end
    tnode
  end

  # This method checks for the node's children and assigns them correctly
  # The first three conditionals take care of 0-1 children
  # The last will take care of 2 children
  def remove(node)
    if node.left.nil? && node.right.nil?
      node = nil
    elsif node.left && node.right.nil?
      node = node.left
    elsif node.left.nil? && node.right
      node = node.right
    else
      node = replace_parent(node)
    end
    node
  end

  # We re-assign the value of the node to equal its successor
  # Then jump over the successor, effectively 'swapping' the nodes
  # We also assign the successor all the branches it's replacing
  # (including size)
  def replace_parent(node)
    succ = successor(node.val)
    succ_successor = successor(succ.val)
    update_size(node)

    succ.size = node.size
    succ.right = node.right
    succ.left = node.left
    succ_successor.left = nil
    succ
  end

  # This works like finding the successor, but instead we're updating the size
  # of the nodes 
  def update_size(node, r = @root)
    return nil if r.nil?
    r.size -= 1

    if r <= node
      return update_size(node, r.right)
    else
      left = update_size(node, r.left)
      return (left || r)
    end
  end
end
