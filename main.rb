# frozen_string_literal: true

# Node to traverse when data is correct
class MoveNode
  attr_accessor :parent, :data, :child

  def initialize(data, parent = nil)
    @data = data
    @parent = parent
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
      queue.unshift(MoveNode.new([start[0] + step[0], start[1] + step[1]]), movenode)
    end
    until movenode.data == endof
      movenode = queue.pop
   
      steps.each do |step|
        queue.unshift(MoveNode.new([movenode.data[0] + step[0], movenode.data[1] + step[1]], movenode))
      end
    end
    variable = traversal(movenode)
    p variable
    puts 'We did it'
  end

  def traversal(node)
    node.parent.nil? ? [node.data] : traversal(node.parent) + [node.data]
  end
end

test = Solution.new
test.min_knight_moves([0, 0], [4, 4])

=begin
# Solution for shortest knight path to given location

# First we have all the steps
# We have a queue to store the steps
# We have a node to store the current location
# Every step in the queue we create a new node, that points to the parent node which was the previous location
# We then add the new node to the queue
# We then pop the first node in the queue and do the same thing
# We then repeat this process until we reach the end location
# We then return the node that is the end location
# We then traverse the node and print the path

# Create a node with the start location given
# Do a for loop to create a node with a new location for each step, parent node as the start location, add to the queue
# As 


=end
