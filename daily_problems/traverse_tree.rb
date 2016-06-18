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
    # takes the root, puts in array
    # prints everything in array
    # then makes array of all childre
    # prints them
    result = [root.data]

    done = false

    while !done
      if !root.left && !root.right
        done = true
        break
      end
      if root.left
        result << root.left
      end
      if root.right
        result << root.right
      end
    end

    # take trailing whitespace into account
    result.each { |data| print "#{data} "}
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
