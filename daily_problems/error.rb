# convert a string into an integer.
# from https://www.hackerrank.com/challenges/30-exceptions-string-to-integer

s = gets.strip
puts ((s.to_i != 0 || s == '0') ? s.to_i : 'Bad String')
