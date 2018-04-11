# Union-Find data structure
#
# (aka Disjoint-set)
# Tracks a set of elements partitioned into a number of disjoint
# (non-overlapping) subsets
#
# Operations
# 1. MakeSet(x):
#   - Makes a new set by creating a new node
#   - Each node contains data, a rank, and parent pointer
#   - Initializes each node with rank 0, and parent pointer to itself
# 2. Find(x):
#   - Follows the chain of parent pointers from 'x' up tree until it reaches a
#     root element, whose parent is itself
#   - Returns root
#   - Applies 'path compression' to flatten the tree, making parent of 'x' the
#     root
# 3. Union(x, y):
#   - Uses Find to determine the roots of the trees 'x' and 'y' and combines the
#     trees by attaching the root of one to the other
#   - Union is implemented by *rank*, which attaches the shorter tree (lower
#     rank) to the taller tree, such that the tree is no taller than original
#   - If ranks are equal, pick one arbitrarily, increase its root rank by 1
class UnionFind

  def initialize
    @parent_map = Hash.new
  end

  def make_set(x)
    # Only create new set if node does not exist
    unless @parent_map[x]
      node = Node.new(x) 
      @parent_map[x] = node
    end
  end

  def find(x)
    node = @parent_map[x]
    return node if node.parent = @parent_map[x]

    traversed = [node]
    until node.parent == node
      traversed << node
      node = node.parent
    end
    compress(traversed, node)
    return node
  end

  def union(x, y)

  end

  private

  def compress(z, r)
    z.each { |node| @parent_map[node.key] = node.parent = r }
  end
end

class Node
  attr_reader :key
  attr_accessor :parent, :rank

  def initialize(data)
    @key = data
    @parent = self
    @rank = 0
  end
end
