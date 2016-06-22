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

# siev of eratosthenes
def prime? num
  nums = (2..num).to_a

  if num == 1 || num < 2
    return 'Not prime'
  end
# still cut it off half way

  i = 0
  while i < nums.length && nums[i] <= num / 2

    j = i + 1
    while j < nums.length
      puts nums.to_s
      if nums[j] % nums[i] == 0
        nums.delete_at j
      end
      j += 1
    end

    return 'Not prime' if nums.last != num
    i += 1
  end


  'Prime'
end

prime? 12
