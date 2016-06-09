# Solution#insert, given the first node in a linked list, and enough data to
# construct a new node, inserts a new node at the end of a linked list based on
# the provided data, and returns the first node in the list. 
# This is my solution to the problem at
# https://www.hackerrank.com/challenges/30-linked-list.


class Node

  attr_accessor :data,:next

  def initialize data
    @data = data
    @next = nil
  end
end

class Solution

  attr_accessor :answer

  def initialize
    @answer = ''
  end

  def insert(head,value)
    nodey = Node.new value
    if head == nil
      head = nodey
    else
      nexty = head.next
      if nexty == nil
        head.next = nodey
      else
        until nexty.next == nil
          nexty = nexty.next
        end
        nexty.next = nodey
      end
    end

    return head
  end

  def display(head)
    current = head
    while current
      @answer << current.data.to_s
      @answer << " "
      current = current.next
    end
  end

end

# runner code
input = [4, 2, 3, 4, 1]
mylist= Solution.new
head=nil
T=input.shift
for i in 1..T
    data=input.shift
    head=mylist.insert(head,data)
end
mylist.display(head)
puts "This solution works => #{mylist.answer == '2 3 4 1 '}"
