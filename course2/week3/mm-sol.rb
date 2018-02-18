# Puts the expanded path where the current directory resides
folder = File.expand_path('.', __dir__)
# Adds that path to $LOAD_PATH so we can 'require' the file
$:.unshift(folder) unless $:.include?(folder)

# Median Maintenance
# Input: Pass a sequence of x1, ..., x_n of numbers, one-by-one
# Output: Each time step `i`, the median of { x1, ..., x_i }
require 'heap'

class MedianMaintenance

  # Initializes the class with a minheap, maxheap, and counter
  # @h_high holds 1/2 largest numbers
  # @h_low holds 1/2 smallest numbers
  def initialize
    @h_high = Heap.new
    @h_low  = Heap.new(:max)
    @counter = 0
  end

  # Inserts into a heap, and returns the median of running total
  # @param [Integer] A value to insert into a heap
  # @return [Integer] The median of all values inserted thus far
  def median(val)
    l = @h_high.peek || Hash[key: 0, value: 0]
    s = @h_low.peek || Hash[key: 0, value: 0]

    if val > l[:value]
      @h_low << val
    else
      @h_high << val
    end
  end

  private

  # Rebalances the two heaps to keep them within one node difference
  # @return [Integer] Returns the final size difference between the two heaps
  def rebalance
    until s_diff.between?(0, 1)
      @h_low << @h_high.extract if size_diff > 1
      @h_high << @h_low.extract if size_diff < 0
    end
    size_diff
  end

  # Gets the size difference between the two heaps
  # @return [Integer] Positive if @h_high is larger than @h_low
  def size_diff
    @h_high.size - @h_low.size 
  end
end
