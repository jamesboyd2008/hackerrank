# convert a string into an integer.
# from https://www.hackerrank.com/challenges/30-exceptions-string-to-integer

# s = gets.strip
# puts ((s.to_i != 0 || s == '0') ? s.to_i : 'Bad String')

# Here's a solution that doesn't use conditionals, i think.

S = gets.strip

begin
    puts Integer S
rescue
    puts 'Bad String'
end
