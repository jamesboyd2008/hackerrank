# from https://www.hackerrank.com/challenges/30-linked-list-deletion

# Solution#removeDuplicates is a method that removes duplicates from a linked
# list.

class Node
  attr_accessor :data,:next

  def initialize data
    @data = data
    @next = nil
  end
end

class Solution

  def removeDuplicates(head)
    data_observed = [head]
    current = head.next

    while current != nil
      values = data_observed.map { |node| node.data }
      if values.include? current.data
        data_observed.last.next = current.next
      else
        data_observed << current
      end
      current = current.next
    end

    head
  end

  def insert(head,value)
    p = Node.new(value)
    if head == nil
         head = p
    elsif head.next == nil
      head.next = p
    else
      current = head
      while current.next != nil
        current = current.next
      end
      current.next = p
    end
    return head
  end

  def display(head)
    current = head
    while current
      print current.data," "
      current = current.next
    end
  end

end

mylist = Solution.new
head = nil
input = ['6', '1', '2', '2', '3', '3', '4']
T = input.shift.to_i

for i in 1..T
  data = input.shift.to_i
  head = mylist.insert(head,data)
end

head = mylist.removeDuplicates(head)
puts " The answer: 1 2 3 4"
print "Your answer: "
mylist.display(head)
puts ''
