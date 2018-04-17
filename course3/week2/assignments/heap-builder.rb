require_relative '../../../course2/week3/heap'

# Builds a heap from a file which contains edges and nodes
class HeapBuilder
  attr_reader :heap, :num_nodes

  def initialize(file)
    @heap = Heap.new    

    File.open(file) do |file|
      file.each_with_index do |line, index|
        line_arr = line.split(' ').map { |n| n.to_i }
        if index == 0
          @num_nodes = line_arr.pop
        else
          # Destructure the array to grab the nodes into an array,
          # and edge cost as a separate variable
          *nodes, edge_cost = line_arr
          @heap.insert(nodes, edge_cost)
        end
      end
    end
  end
end
