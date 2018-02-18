# Puts the expanded path where the parent directory resides
folder = File.expand_path('../', __dir__)
# Adds that path to $LOAD_PATH so we can 'require' the file
$:.unshift(folder) unless $:.include?(folder)

require 'rds/graph_builder'
require 'week3/heap'

class Dijkstra
  
  def initialize(file_name)
    @graph = GraphBuilder.new(file_name).build
    @minheap = Heap.new
    @dist = Hash.new(Float::INFINITY)
    @preds = Hash.new
  end

  def find_shortest(source = 1)
    # Initialize source vertex
    @dist[source] = 0
    @minheap.insert(source, @dist[source])

    # Get adjacency list and lengths
    adj_list = @graph.get_list
    edge_lengths = @graph.get_lengths

    until @minheap.empty?
      curr = @minheap.extract[:key]
      # Get neighboring vertices
      neighbors = adj_list[curr]
      # '&.' is safe navigation operator -- only called if 'neighbors' exists
      neighbors&.each do |vert|
        # Calculate the distance between the current vertex and the next
        tent_dist = @dist[curr] + edge_lengths[curr][vert]

        # If the distance is shorter, then we will add it to our queue by
        # using its distance from our current vertex as its priority
        if tent_dist < @dist[vert]
          @dist[vert] = tent_dist
          @preds[vert] = curr
          @minheap.insert(vert, @dist[vert])
        end
      end
    end
    {
      distance_from_source: @dist,
      predecessors: @preds
    }
  end
end

d = Dijkstra.new(File.expand_path('dijkstraData.txt', __dir__))
result = d.find_shortest

req = [7, 37, 59, 82, 99, 115, 133, 165, 188, 197]
p req.map { |i| result[:distance_from_source][i] }
