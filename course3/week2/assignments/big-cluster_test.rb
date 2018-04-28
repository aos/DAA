require 'minitest/autorun'
require_relative 'big-cluster'

class TestKClusterSolution < MiniTest::Test
  DATA_PATH = './problem-data/clustering_big.txt'

  def setup
    @bc = BitCluster.new(DATA_PATH)
  end

  # Runtime = 531 seconds
  def test_gets_all_nodes_and_k
    @k = @bc.find_k
    @num_nodes = @bc.num_nodes
    assert_equal @num_nodes, 200_000
    assert_equal @k, 6118
  end
end
