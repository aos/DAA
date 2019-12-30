# Builds a hash from a file with format:
#   [node_of_edge_1][other_node_of_edge_1][edge_1_cost]
#   [node_of_edge_2][other_node_of_edge_2][edge_2_cost]
#   ...
#   [node_of_edge_n][other_node_of_edge_n][edge_n_cost]
#   Hash consists of objects of edge/cost (might be overkill)
# @!attribute [r] nodes
#   @return [Object] the vertices hash which contains a heap connected edges
# @!attribute [r] initial_node
#   @return [Integer] the initial arbitrary node picked
# @!attribute [r] num_nodes
#   @return [Integer] the number of nodes in graph
# @!attribute [r] num_edges
#   @return [Integer] the number of edges in graph
class HashBuilder
  attr_reader :nodes, :initial_node, :num_nodes, :num_edges

  # Creates a hash from the file given
  #
  # @param [String] File given
  def initialize(file)
    @nodes = Hash.new

    File.open(file) do |file|
      file.each_with_index do |line, index|
        line_dirty = line.split(' ').map { |n| n.to_i }
        if index == 0
          @num_nodes, @num_edges = line_dirty
        else
          # Destructure the array to grab the nodes and edge cost
          *nodes, edge_cost = line_dirty
          # Pick a random node as start
          @initial_node ||= nodes[0]
          # Inserts the nodes into the hash table with the edge cost
          insert(nodes, edge_cost)
        end
      end
    end
  end

  private

  def insert(nodes, edge_cost)
    nodes.each do |n|
      @nodes[n] ? 
        @nodes[n] << { adjacent: get_other_node(nodes, n), cost: edge_cost } :
        @nodes[n] = [ { adjacent: get_other_node(nodes, n), cost: edge_cost } ]
    end
  end

  def get_other_node(nodes, n)
    n == nodes[0] ? nodes[1] : nodes[0]
  end
end
