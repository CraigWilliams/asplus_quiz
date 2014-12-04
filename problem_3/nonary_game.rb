class NonaryGame

  def initialize
    numbers = (1..8).to_a
    @groups = 3.upto(5).flat_map { |num| numbers.combination(num).to_a }
  end

  def valid_groups
    @groups.map do |group|
      next unless group.include?(5)
      group if sum(group) == 9
    end.compact
  end

  private

  def sum(nums)
    reduced = nums.inject(&:+).to_s.split('').map(&:to_i)
    reduced.size > 1 ? sum(reduced) : reduced.first
  end
end
