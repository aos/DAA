require 'minitest/autorun'
require_relative 'mst'

class TestMSTSolution < MiniTest::Test
  DATA_PATH = './problem-data/edges.txt'

  def setup
    @hash_obj = HashBuilder.new(DATA_PATH)
    @num_edges = @hash_obj.num_edges
    @num_nodes = @hash_obj.num_nodes
  end

  def test_gets_all_edges
    assert_equal @num_edges, 2184
  end

  def test_gets_all_nodes
    assert_equal @num_nodes, 500
  end

  def test_gets_cost_mst
    mst = MST.new(@hash_obj).total_cost
    assert_equal mst, -3612829
  end
end
