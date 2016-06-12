# Write a Calculator class with a single method: int power(int,int).
# The power method takes two integers, n and p, as parameters and returns the
# integer result of n^p. If either  or  is negative, then the method must
# throw an exception with the message: n and p should be non-negative.

# from https://www.hackerrank.com/challenges/30-more-exceptions

class Calculator
    def power n, p
        if n < 0 || p < 0
            raise StandardError, "n and p should be non-negative"
        end
        n ** p
    end
end

#runner code
input = ['4', '3 5', '2 4', '-1 -2', '-1 3']
myCalculator=Calculator.new()
T=input.shift.to_i
for i in 1..T
    n,p = input.shift.split.map(&:to_i)
    begin
        ans=myCalculator.power(n,p)
        puts ans
    rescue Exception=> e
        puts e
    end
end
