# frozen_string_literal: true

# Knight class to calculate how to get one square to another.
class Knight
  # Relevant attr accessor
  # Method to move
  def move(start = [0, 0], endof = [1, 2])
    waystomove = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end
end

# Solution for shortest knight path to given location
class Solution
  def min_knight_moves(start = [0, 0], endof = [1, 2])
    steps = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    seen = []
    queue = []
    steps.each do |step|
      queue.unshift([start[0] + step[0], start[1] + step[1]])
    end
    until start == endof

      start = queue.pop
      steps.each do |step|
        queue.unshift([start[0] + step[0], start[1] + step[1]])
      end
    end
    puts 'We did it'
  end
end

test = Solution.new
test.min_knight_moves([0, 0], [2, 4])
