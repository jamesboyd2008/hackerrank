# from https://www.hackerrank.com/challenges/30-binary-search-trees
# Write a method, Solution#levelOrder, that prints the nodes of a
# binary search tree by level, from top to bottom.

class Node
  attr_accessor :left, :right, :data

  def initialize data
    @left = @right = nil
    @data = data
  end
end

class Solution
  def insert (root, data)
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

  def levelOrder root
    result = [root]

    done = false

    result.each do |node|
      if node.left
        result << node.left
      end
      if node.right
        result << node.right
      end
    end

    result.each { |node| print "#{node.data} "}
  end
end

# Runner code
myTree = Solution.new
root = nil
input = [6, 3, 5, 4, 7, 2, 1]
T = input.shift.to_i

for i in 1..T
  data = input.shift.to_i
  root = myTree.insert(root,data)
end

puts " The answer: 3 2 5 1 4 7"
print "Your answer: "
myTree.levelOrder(root)
puts ''
