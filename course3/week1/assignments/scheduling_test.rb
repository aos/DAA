require 'minitest/autorun'
require '../assignments/scheduling'

class TestSchedulingSolution < MiniTest::Test
  DATA_PATH = '../assignments/problem-data/jobs.txt'

  def setup
    @job_class = JobBuilder.new(DATA_PATH)
  end

  def test_get_all_jobs
    assert_equal @job_class.num_jobs, 10000
  end

  def test_get_diff_weighted_sum
    sum = Scheduler.new(@job_class.jobs, 'difference').sum_weighted
    assert_equal sum, 69119377652
  end

  def test_get_ratio_weighted_sum
    sum = Scheduler.new(@job_class.jobs, 'ratio').sum_weighted
    assert_equal sum, 67311454237
  end
end
