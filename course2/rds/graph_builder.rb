require 'set'

class GraphBuilder
  def initialize(file_name)
    @file_name = file_name
    @graph = Hash.new
    @lengths = []
  end

  def build
    File.open(@file_name) do |file|
      file.each do |line|
        split_line = line.split(/\s/)
        vert = split_line[0].to_i
        # Add vertex to graph if it doesn't exist
        @graph[vert] ||= Set.new
        split_line[1..-1].each do |ele|
          pair = ele.split(',').map { |n| n.to_i }
          # Create adjacency list
          @graph[vert].add(pair[0])
          # Create lengths matrix
          @lengths[vert] ||= []
          @lengths[vert][pair[0]] = pair[1]
        end
      end
    end
    self
  end

  def get_list
    raise Exception, "List empty -- call build() first" if @graph.empty?
    @graph
  end
  
  def get_lengths
    raise Exception, 
      "Lengths matrix empty -- call build() first" if @lengths.empty?
    @lengths
  end
end
