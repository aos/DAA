require 'minitest/autorun'
require_relative '../week4/hash'

class Test2SumSolution < MiniTest::Test
  DATA_PATH = '../week4/2-sum-data.txt'.freeze
  TEST_PATH = '../tests/input_random_40_5120.txt'.freeze

  def setup
    @range = -10_000..10_000
    @total_lines = 0
    @ht = HashTable.new(808_237)

    File.open(DATA_PATH) do |f|
      f.each do |line|
        num = line.to_i
        @ht.insert(num)
        @total_lines += 1
      end
    end
  end

  def test_gets_all_numbers
    assert_equal @total_lines, 1_000_000
  end

  def test_solution
    puts "\nStarted computing solution @ #{Time.now}..."
    sum_total = 0

    # Target value must be between [-10000, 10000]
    # Answer: between 0 and 20001
    #
    # Your task is to compute the number of target values 't' in the interval
    # [-10000,10000] (inclusive) such that there are distinct numbers x,y in the
    # input file that satisfy x+y=t.
    # NOTE: I only test 5120 in this file, as the 1000000 integer file would
    # require a running time of O(range * N) which... would take forever

    @range.each do |r_num|
      @ht.each do |x|
        num = r_num - x.val
        found = @ht.lookup(num)

        if found
          sum_total += 1
          break
        end
      end
    end
    puts "Solution found @ #{Time.now}"
    puts "Soultion: #{sum_total}"
  end
end
