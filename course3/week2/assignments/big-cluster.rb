# Distances defined implicitly
# Nodes are defined as 24 bits, eg (node 2):
# "0 1 1 0 0 1 1 0 0 1 0 1 1 1 1 1 1 0 1 0 1 1 0 1"
#
# - What is the largest value of 'k' such that there is a 'k'-clustering with
#   spacing at least 3? 
# - That is, how many clusters are needed to ensure that no pair of nodes with
#   all but 2 bits in common get split into different clusters?
#
# Hint: Is there some way you can identify the smallest distances without
# explicitly looking at every pair of nodes?
require_relative 'uf'

class BitCluster
  attr_reader :num_nodes

  def initialize(file)
    @file = file
    @uf = UnionFind.new
    @num_clusters = 0
  end

  def find_k
    File.open(@file) do |file|
      file.each_with_index do |line, index| 
        line_arr = line.split(' ')
        if index == 0
          @num_nodes = @num_clusters = line_arr[0].to_i
        else
          bits = line_arr.join
          # Make every node a set
          # Reduce number of clusters by 1 if they are equal distance
          # Same # of bits
          @num_clusters -= 1 unless @uf.make_set(bits)
        end
      end
    end

    # Check for spacing = 1, and spacing = 2
    # Union all nodes with above spacing, and reduce number of clusters
    File.open(@file) do |file|
      file.each_with_index do |line, index|
        bits = line.split(' ')
        unless index == 0
          # Take all bits which are 1-spacing away and merge them into same set
          bits.each_with_index do |x, i|
            temp = bits.dup
            temp[i] = (x == '0' ? '1' : '0')
            @num_clusters -= 1 if @uf.union(bits.join, temp.join)

            # Merge all 2-spacing nodes into same set
            temp.each_with_index do |y, j|
              next if i == j
              temp2 = temp.dup
              temp2[j] = (y == '0' ? '1' : '0')
              @num_clusters -= 1 if @uf.union(bits.join, temp2.join)
            end
          end
        end
      end
    end
    @num_clusters
  end

  private

  def pop_count(s)
    total_bits = '1' * 24
    (s ^ total_bits).count('1')
  end

  def hamming(u, v)
    raise ArgumentError.new('Must be the same length') if u.length != v.length
    v = v.split(' ')
    u = u
      .split(' ')
      .select
      .with_index { |c, i| c != v[i] }
      .length
  end

end
