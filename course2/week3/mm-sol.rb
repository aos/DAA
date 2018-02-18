# Puts the expanded path where the current directory resides
folder = File.expand_path('.', __dir__)
# Adds that path to $LOAD_PATH so we can 'require' the file
$:.unshift(folder) unless $:.include?(folder)
require 'heap'

# Median Maintenance
# Input: Pass a sequence of x1, ..., x_n of numbers, one-by-one
# Output: Each time step `i`, the median of { x1, ..., x_i }
class MM

  # Initializes the class with a minheap, maxheap, and counter
  # @h_high holds 1/2 largest numbers, uses 'extract_min' op
  # @h_low holds 1/2 smallest numbers, uses 'extract_max' op
  def initialize
    @h_high = Heap.new
    @h_low  = Heap.new(:max)
    @counter = 0
  end

  # Inserts into a heap and rebalance heaps
  # @param [Integer] A value to insert into a heap
  # @return [Boolean] Returns true on insertion
  def insert(val)
    h_min = @h_high.peek || Hash.new(0)
    l_max = @h_low.peek || Hash.new(0)

    if val >= h_min[:value]
      @h_high << val
    else
      @h_low << val
    end
    @counter += 1
    # Rebalance heaps after insertion
    rebalance
  end

  # Finds the median of the supplied values
  # @return [Interger] Median value from all inserted values
  def median
    raise Exception, 'You must insert at least one value' if @counter == 0 
    h_min = @h_high.peek || Hash.new(0)
    l_max = @h_low.peek || Hash.new(0)

    if @counter.even?
      return l_max[:value]
    else
      return h_min[:value]
    end
  end

  private

  # Rebalances the two heaps to keep them within one node difference
  # @private
  # @return [Integer] Returns the final size difference between the two heaps
  def rebalance
    until size_diff.between?(0, 1)
      @h_low << @h_high.extract[:value] if size_diff > 1
      @h_high << @h_low.extract[:value] if size_diff < 0
    end
    size_diff
  end

  # Gets the size difference between the two heaps
  # @private
  # @return [Integer] Positive if @h_high is larger than @h_low
  def size_diff
    @h_high.size - @h_low.size 
  end
end
