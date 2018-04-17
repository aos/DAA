require_relative './uf'

# Computes the max-spacing k-clustering
class KCluster
  
  def initialize(k, heap)
    @k = k
    @uf = UnionFind.new
    @heap = heap.heap
    @num_nodes = heap.num_nodes
  end

  # 1. Pop edges out from heap one by one
  # 2. Call make_set on each node
  # 3. Call union on the nodes
  # 4. Stop when number of clusters is equal to 'k'
  def max_spacing
    clusters = @num_nodes

    until clusters == @k
      d = @heap.extract
      nodes = d[:key]
      edge = d[:value]

      nodes.each { |n| @uf.make_set(n) }
      clusters -= 1 if @uf.union(nodes[0], nodes[1])
    end

    # Loop until the first new non-set edge
    # This is the max-spacing for 'k' clusters
    loop do
      d = @heap.extract
      nodes = d[:key]
      edge = d[:value]

      nodes.each { |n| @uf.make_set(n) }
      return edge if @uf.union(nodes[0], nodes[1])
    end
  end
end
