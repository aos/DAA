require 'minitest/autorun'
require_relative '../week3/mm-sol'

class TestMedianMaintenance < MiniTest::Test
  DATA_PATH = '../week3/median-maintenance-data.txt'

  def setup
    @total_lines = 0
    @solution = 0

    File.open(DATA_PATH) do |file|
      total = 0
      mm = MM.new

      file.each do |line|
        @total_lines += 1
        num = line.to_i 
        mm.insert num
        total += mm.median
      end
      @solution = total.modulo(10000)
    end
  end

  def test_gets_all_numbers
    assert_equal 10000, @total_lines
  end

  def test_solution_is_1213
    assert_equal 1213, @solution
  end
end
