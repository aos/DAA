require 'minitest/autorun'
require_relative 'k-cluster'
require_relative 'heap-builder'

class TestKClusterSolution < MiniTest::Test
  DATA_PATH = './problem-data/clustering1.txt'

  def setup
    @heap = HeapBuilder.new(DATA_PATH)
    @num_nodes = @heap.num_nodes
  end

  def test_gets_all_nodes
    assert_equal @num_nodes, 500
  end

  def test_gets_max_spacing_4_cluster
    @kc = KCluster.new(4, @heap)
    assert_equal @kc.max_spacing, 106
  end
end
