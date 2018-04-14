require_relative '../../../course2/week3/heap'

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

