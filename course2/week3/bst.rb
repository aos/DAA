class BinarySearchTree
  class Node
    # Requires implementing 'each' method
    include Enumerable

    attr_reader :val
    attr_accessor :left, :right, :size

    def initialize(val)
      @val = val
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
    if val.respond_to?('each')
      val.each { |a| insert_helper(@root, a) { |v| @root = v } }
    else
    # Calls the insert_helper with a block that knows how to assign root
      insert_helper(@root, val) { |v| @root = v }
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

  # Defines min/max methods
  { min: :left, max: :right }.each do |k, v|
    define_method k do
      current = @root
      while current
        return current if current.send(v).nil?
        current = current.send(v)
      end
    end
  end

  private

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
end
