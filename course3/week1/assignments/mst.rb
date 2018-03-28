require_relative '../../../course2/week3/heap'
require 'byebug'

# Builds a minimum spanning tree (MST) from a given heap_builder object
# Expects the heap_builder object to contain #heap
class MST
  # Initializes the heap instance from the heap_builder object
  #
  # @param [Object] The heap builder object
  def initialize(hash_builder)
    @nodes = hash_builder.nodes
    @initial_node = hash_builder.initial_node
    @explored = Hash.new(false)
    @heap = Heap.new
  end

  # Calculates the overall cost of a minimum spanning tree
  #
  # @return [Integer] overall cost
  def total_cost
    total = 0
    # Insert initial node's edges into heap
    @nodes[@initial_node].each do |n|
      @heap.insert(n[:adjacent], n[:cost])
    end
    # Mark as explored
    @explored[@initial_node] = true

    until @heap.empty?
      next_node = @heap.extract
      unless @explored[next_node[:key]]
        @explored[next_node[:key]] = true
        # Add the closest adjacent node edge to total MST
        total += next_node[:value]
        # Insert that node's adjacents into heap
        @nodes[next_node[:key]].each do |a|
          @heap.insert(a[:adjacent], a[:cost])
        end
      end
    end
    total
  end
end

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
          # Destructure the array to grab the nodes into an array,
          # and edge cost as a separate variable
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
