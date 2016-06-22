# STDIN.each { |num| input << num.to_i }


# def prime? num
  # j = 2
  # i = num / j
  # while i > 1
    # if num % i == 0
      # puts "it's divisible by #{i}"
      # return 'Not prime'
    # end
    # j += 1
    # i = num / j
  # end
#
  # if num == 1 || num < 2
  #   return 'Not prime'
  # end
#
  # 'Prime'
# end
#
# input.slice(1..-1).each { |el| puts prime? el }

# def prime? num
#   divisors_tried = [
#     2, 3, 5, 7, 11, 13, 17, 19, 23, 29,
#     31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
#     73, 79, 83, 89, 97, 101, 103, 107, 109, 113,
#     127, 131, 137, 139, 149, 151, 157, 163, 167, 173,
#     179, 181, 191, 193, 197, 199, 211, 223, 227, 229,
#     233, 239, 241, 251, 257, 263, 269, 271, 277, 281,
#     283, 293, 307, 311, 313, 317, 331, 337, 347, 349,
#     353, 359, 367, 373, 379, 383, 389, 397, 401, 409,
#     419, 421, 431, 433, 439, 443, 449, 457, 461, 463,
#     467, 479, 487, 491, 499, 503, 509, 521, 523, 541
#   ]
#
#   i = 0
#
#   while i < divisors_tried.length
#     if num % divisors_tried[i] == 0 && num != divisors_tried[i]
#       return 'Not prime'
#     end
#     i += 1
#   end
#
  # if num == 1 || num < 2
  #   return 'Not prime'
  # end
  #
  # 'Prime'
# end

# Time elapsed: 211.863636 seconds
# def prime? num
#   start = Time.now
#   nums = (2..num).to_a
#   # puts nums.to_s
#
#   if num == 1 || num < 2
#     return 'Not prime'
#   end
# # still cut it off half way
#
#   half = num / 2
#   i = 0
#   while i < nums.length # nums[i] <= half
#     if num % nums[i] == 0
#       finish = Time.now
#       puts "Time elapsed: #{finish - start} seconds"
#       return 'Not prime'
#     end
#
#     j = i + 1
#     while j < nums.length # nums[j] <= half
#       if nums[j] % nums[i] == 0
#         nums.delete_at j
#       end
#       j += 1
#     end
#
#     puts "Just removed #{nums[i]}"
#     if nums.last != num
#       finish = Time.now
#       puts "Time elapsed: #{finish - start} seconds"
#       return 'Not prime'
#     end
#     i += 1
#   end
#
#
#   finish = Time.now
#   puts "Time elapsed: #{finish - start} seconds"
#   'Prime'
# end

# sieve of eratosthenes
def primeSieve(n)
  primes = Array.new

  for i in 0..n-2
   primes[i] = i+2
  end

  index = 0
  while Math.sqrt(primes.last).ceil >= primes[index]
    (primes[index] * 2).step(primes.last, primes[index]) do |x|
      if x == n
        return 'Not Prime'
      end
      primes.delete(x)
    end
    index += 1
  end

  'Prime'
end

puts primeSieve(ARGV[0].to_i).to_s
