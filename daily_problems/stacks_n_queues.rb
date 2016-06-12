# from https://www.hackerrank.com/challenges/30-queues-stacks
# A palindrome is a word, phrase, number, or other sequence of characters which reads the same backwards and forwards. Can you determine if a given string, s, is a palindrome?

# To solve this challenge, we must first take each character in s, enqueue it in
# a queue, and also push that same character onto a stack. Once that's done, we
# must dequeue the first character from the queue and pop the top character off
# the stack, then compare the two characters to see if they are the same; as
# long as the characters match, we continue dequeueing, popping, and
# comparing each character until our containers are empty (a non-match
# means s isn't a palindrome).
#
# Write the following declarations and implementations:
#
# Two instance variables: one for your queue, and one for your stack.
# A void pushCharacter(char ch) method that pushes a character onto a stack.
# A void enqueueCharacter(char ch) method that enqueues a character in the
# queue instance variable.
# A char popCharacter() method that pops and returns the character at the top
# of the stack instance variable.
# A char dequeueCharacter() method that dequeues and returns the first
# character in the queue instance variable.


class Solution
  def initialize
    @stack = Array.new
    @queue = Array.new
  end

  def pushCharacter char
    @stack.unshift char
  end

  def popCharacter
    @stack.shift
  end

  def enqueueCharacter char
    @queue.push char
  end

  def dequeueCharacter
    @queue.shift
  end
end


# ******************************Runner code.************************************
words = ['racecar', 'anneivotemorecarsracerometovienna', 'vogleweed']

words.each do |s|
  # s='racecar'
  #Create the Solution class object
  obj=Solution.new()
  l=s.length
  # push/enqueue all the characters of string s to stack
  for i in 0...l
      obj.pushCharacter(s[i])
      obj.enqueueCharacter(s[i])
  end

  isPalindrome=true
  '''
  pop the top character from stack
  dequeue the first character from queue
  compare both the characters
  '''
  for i in 0...(l / 2)
      if obj.popCharacter()!=obj.dequeueCharacter()

          isPalindrome=false
          break
      end
  end
  #finally print whether string s is palindrome or not.
  if isPalindrome
      puts("The word, "+s+", is a palindrome.")
  else
     puts("The word, "+s+", is not a palindrome.")
  end
end
