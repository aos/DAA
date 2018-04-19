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
    @node_map = Hash.new
  end

  def make_set(x)
    # Only create new set if node does not exist
    return false if @node_map[x]
    node = Node.new(x) 
    @node_map[x] = node
  end

  def find(x)
    node = @node_map[x]
    return false unless node
    return node.parent if node.parent == node.parent.parent

    # Follow parent pointers to root, store traversed nodes in array
    traversed = [node]
    until node.parent == node
      traversed << node
      node = node.parent
    end
    # Apply path compression to traversed nodes and return root
    compress(traversed, node)
  end

  def union(x, y)
    root_x = find(x)
    root_y = find(y)
    return false unless (root_x && root_y) && (root_x != root_y)

    if root_x.rank > root_y.rank
      @node_map[root_y.key].parent = @node_map[y].parent = root_x
    elsif root_y.rank > root_x.rank
      @node_map[root_x.key].parent = @node_map[x].parent = root_y
    else
      @node_map[root_y.key].parent = @node_map[y].parent = root_x
      root_x.rank += 1
    end
    true
  end

  private

  def compress(trav, root)
    trav.each { |node| node.parent = root }
    root
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
