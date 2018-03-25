# Given a list of jobs with weights (priorities) and a length
# Calculate the optimum schedule for all jobs using one of two strategies:
# 1. Difference between weight and length (w - l)
# 2. Ratio between weight and length (w / l)
#
# @param [Array] An array of jobs in hash format
class Scheduler
  TYPES = { difference: :-, ratio: :/ }
 
  # Initializes the jobs passed in from the JobBuilder class
  # Sorts the jobs based on scoring criteria (difference or ratio)
  #
  # @param [class] Initialized JobBuilder class
  # @param [String, Symbol] The scoring criteria for each job
  #   can be either 'difference' or 'ratio'
  # @return [Array] Sorted array of jobs based on criteria
  def initialize(js, type)
    @jobs = js.sort do |j_x, j_y| 
      score_x = j_x[:weight].send(TYPES[type.to_sym], j_x[:length].to_f)
      score_y = j_y[:weight].send(TYPES[type.to_sym], j_y[:length].to_f)
      s = score_y <=> score_x
      s.zero? ? j_y[:weight] <=> j_x[:weight] : s
    end
  end

  def sum_weighted
    @total_comp_time = 0
    @weighted_sum = 0
    @jobs.each do |j|
      @total_comp_time += j[:length]
      @weighted_sum += (@total_comp_time * j[:weight])
    end
    @weighted_sum
  end
end

# Given a file with format:
#   [number_of_jobs]
#   [job_1_weight][job_1_length]
#   ...
#   [job_n_weight][job_n_length]
#
# Each job will be a hash of format: { weight: [Integer], length: [Integer] }
# @param [String] File name
# @return [Array] An array of job hashes
class JobBuilder
  attr_reader :num_jobs, :jobs

  def initialize(file)
    @jobs = []

    File.open(file) do |file|
      file.each_with_index do |line, index|
        @num_jobs = line.to_i if index == 0
        unless index == 0
          job_arr = line.split(' ').map { |j| j.to_i }
          job = { weight: job_arr[0], length: job_arr[1] }
          @jobs.push job
        end
      end
    end
  end
end
