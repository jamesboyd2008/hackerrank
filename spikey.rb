n_from_5_to_3 = []
#
# [n_is_2, n_is_3, n_is_4, n_is_5].each do |test_set|
#   test_set.unshift (test_set.length / 3).to_s
# end

num = 1023 # for n = 5
while num > 15
  binary = num.to_s 2
  if binary.chars.length % 2 == 0
    temp_n = binary.chars.length / 2
    row1 = binary.chars[0..temp_n - 1].join
    row2 = binary.chars[temp_n..-1].join
    n_from_5_to_3 << temp_n.to_s << row1 << row2
  end
  num -= 1
end

n_from_5_to_3.unshift (n_from_5_to_3.length / 3).to_s

puts n_from_5_to_3

0, 1, 0, 1, 0
  0, 1, 0, 1, 0
