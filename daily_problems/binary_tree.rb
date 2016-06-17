# from https://www.hackerrank.com/challenges/30-binary-search-trees
# Write a method, Solution#getHeight, that returns the height of a binary tree.

class Node
  attr_accessor :left, :right, :data

  def initialize data
    @left = @right = nil
    @data = data
  end
end

class Solution
  def insert (root,data)
    if root == nil
      return Node.new(data)
    else
      if data <= root.data
        cur = self.insert(root.left, data)
        root.left = cur
      else
        cur = self.insert(root.right, data)
        root.right = cur
      end
    end
    return root
  end

  def getHeight(root)
    #Write your code here
  end
end

# Runner code
myTree = Solution.new
root = nil
input = [7, 3, 5, 2, 1, 4, 6, 7]
T = input.shift.to_i

for i in 1..T
  data = input.shift.to_i
  root = myTree.insert(root,data)
end

height = myTree.getHeight(root)
puts "Your solution works: #{height == 3}"
