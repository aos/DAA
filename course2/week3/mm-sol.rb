# Puts the expanded path where the current directory resides
folder = File.expand_path('.', __dir__)
# Adds that path to $LOAD_PATH so we can 'require' the file
$:.unshift(folder) unless $:.include?(folder)

require 'heap'

class MedianMaintenance

  # @minheap holds 1/2 largest numbers
  # @maxheap holds 1/2 smallest numbers
  def initialize
    @minheap = Heap.new
    @maxheap = Heap.new { |x, y| (x <=> y) == 1 }
  end
end
