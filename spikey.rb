require 'csv'

n_from_5_to_3 = []

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

result = []

i = 1
while i < n_from_5_to_3.length
  row1 = n_from_5_to_3[i].chars
  # puts n_from_5_to_3[i + 1]
  row2 = n_from_5_to_3[i + 1].chars
  if (row1.count('1') + row2.count('1')).even?
    result << n_from_5_to_3[i - 1] << row1.join << row2.join
  end
  i += 3
end

result.unshift (result.length / 3).to_s

# CSV.open('test_data.csv', 'wb') do |csv|
#   result.each do |element|
#     csv << [element]
#   end
# end
