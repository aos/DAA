require 'minitest/autorun'
require_relative 'mst'

class TestMSTSolution < MiniTest::Test
  DATA_PATH = './problem-data/edges.txt'

  def setup
    heap_obj = EdgeHeapBuilder.new(DATA_PATH)
    @heap = heap_obj.heap
    @num_edges = heap_obj.num_edges
    @num_nodes = heap_obj.num_nodes
  end

  def test_gets_all_edges
    assert_equal @num_edges, 2184
  end

  def test_gets_all_nodes
    assert_equal @num_nodes, 500
  end

  def test_gets_cost_mst

  end
end
