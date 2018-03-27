require_relative '../../../course2/week3/heap'

# Builds a minimum spanning tree (MST) from a given heap_builder object
# Expects the heap_builder object to contain #heap
class MST

  # Initializes the heap instance from the heap_builder object
  #
  # @param [Object] The heap builder object
  def initialize(heap_builder)
    @heap = heap_builder.heap
    @visited = Hash.new
  end

  # Calculates the overall cost of a minimum spanning tree
  #
  # @return [Integer] overall cost
  def total_cost
    
  end
end

# Builds a heap from a file with format:
#   [node_of_edge_1][other_node_of_edge_1][edge_1_cost]
#   [node_of_edge_2][other_node_of_edge_2][edge_2_cost]
#   ...
#   [node_of_edge_n][other_node_of_edge_n][edge_n_cost]
#   Heap node key is edge cost, heap value is edge of format [u, v]
# @!attribute [r] verts
#   @return [Object] The vertices hash which contains a heap connected edges
# @!attribute [r] num_nodes
#   @return [Integer] the number of nodes in graph
# @!attribute [r] num_edges
#   @return [Integer] the number of edges in graph
class HashBuilder
  attr_reader :verts, :num_nodes, :num_edges

  # Creates a heap from the file given
  #
  # @param [String] File given
  def initialize(file)
    @verts = Hash.new

    File.open(file) do |file|
      file.each_with_index do |line, index|
        line_dirty = line.split(' ').map { |n| n.to_i }
        if index == 0
          @num_nodes, @num_edges = line_dirty
          # Destructure the array to grab the nodes into an array,
          # and edge cost as a separate variable
        else
          *nodes, edge_cost = line_dirty
          # Inserts the nodes into the hash table with the edge cost
          nodes.each { |node| insert(node, edge_cost) }
        end
      end
    end
  end

  private

  # Inserts a node into the vertices hash with the minimum edge cost
  #
  # @param [Integer] node identifier
  # @param [Integer] edge cost as identified from file
  # @return [Object] vertex
  def insert(node, cost)
    if e = @verts[node]
      @verts[node] = min(e, cost)
    else
      @verts[node] = cost
    end
  end
end
