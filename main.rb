# frozen_string_literal: true

# Node to traverse when data is correct
class MoveNode
  attr_accessor :parent, :data, :child

  def initialize(data, parent = nil)
    @parent = parent
    @data = data
  end
end

# Knight class to calculate how to get one square to another.
# class Knight
#   # Relevant attr accessor
#   # Method to move
#   def move(start = [0, 0], endof = [1, 2])
#     waystomove = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
#   end
# end

# Solution for shortest knight path to given location
class Solution
  def min_knight_moves(start = [0, 0], endof = [1, 2])
    steps = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    # seen = []
    movenode = MoveNode.new(start)
    queue = []
    steps.each do |step|
      queue.unshift([start[0] + step[0], start[1] + step[1]])
    end
    until movenode.data == endof
      movenode.data = queue.pop
      movenode.parent = MoveNode.new(movenode.data, movenode)
      steps.each do |step|
        queue.unshift([movenode.data[0] + step[0], movenode.data[1] + step[1]])
      end
      movenode = movenode.parent
    end
    # variable = traversal(movenode)
    # p variable
    puts 'We did it'
  end

  def traversal(node)
    empty_array = []
    empty_array.append(node.data)
    return if node.parent.nil?

    traversal(node.parent)
    empty_array
  end
end

test = Solution.new
test.min_knight_moves([0, 0], [2, 4])
