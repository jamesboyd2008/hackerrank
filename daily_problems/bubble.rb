# from https://www.hackerrank.com/challenges/30-sorting

# Implement a simple bubble sorting algorithm.

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
swaps = 0

n.times do
  no_change = true

  i = 0
  while i < a.length - 1
    if a[i] > a[i + 1]
      no_change = false
      swaps += 1
      smaller_element = a[i + 1]
      larger_element = a[i]
      a[i] = smaller_element
      a[i + 1] = larger_element
    end
    i += 1
  end

  if no_change == true
    puts "Array is sorted in #{swaps} swaps."
    puts "First Element: #{a.first}"
    puts "Last Element: #{a.last}"
    break
  end
end
