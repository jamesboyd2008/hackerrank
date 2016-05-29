# INPUT: two arrays, whose elements are '1's and '0's.
# OUTPUT: boolean
def isolated_zero? row1, row2
  row1_indeces = []
  row2_indeces = []

  row1.each_with_index do |cell, index|
    if cell == '0'
      row1_indeces << index
    end
  end

  row2.each_with_index do |cell, index|
    if cell == '0'
      row2_indeces << index
    end
  end

  puts "row1_indeces: #{row1_indeces.to_s}"
  puts "row2_indeces: #{row2_indeces.to_s}"

  row1_indeces.each do |index|
    # Is the zero isolated?

    if ((row1[index - 1] == '1' && index > 0) || index == 0) &&
       (row1[index + 1] == '1' || index == row1.length - 1) &&
       row2[index] == '1' &&
       (row2[index - 1] == '1' || index == row2.length - 1)
      if (row1 == ['1', '1', '1'] && row2 == ['1', '1', '0']) #||
        # (row1 == ['0', '1', '1'] && row2 == ['0', '1', '0'])
        puts "row1: #{row1.to_s}"
        puts "row2:   #{row2.to_s}"
        puts "row1[#{index}]: #{row1[index]}"
        puts "row1[index - 1]: #{row1[index - 1]}"
        puts "row1[index + 1]: #{row1[index + 1]}"
        puts "row2[index] (bottom-right): #{row2[index]}"
        puts "row2[index - 1] (bottom-left): #{row2[index - 1]}"
      end
      return true
    end
  end

  row2_indeces.each do |index|
    puts "row1: #{row1.to_s}"
    puts "row2:   #{row2.to_s}"
    # puts "row2[#{index}]: #{row2[index]}"
    # puts "row2[index - 1]: #{row2[index - 1]}"
    # puts "row2[index + 1]: #{row2[index + 1]}"
    # puts "row1[index] (top-left): #{row1[index]}"
    # puts "row1[index + 1] (top-right): #{row1[index + 1]}"
    if ((row2[index - 1] == '1' && index > 0) || index == 0) &&
       (row2[index + 1] == '1' || index == row2.length - 1) &&
       row1[index] == '1' &&
       (row1[index + 1] == '1' || index == row1.length - 1)
       if (row1 == ['1', '1', '1'] && row2 == ['1', '1', '0']) #||
        #  (row1 == ['0', '1', '1'] && row2 == ['0', '1', '0'])
       end
      return true
    end
  end

  false
end

puts "Result: #{isolated_zero? ['0', '1', '1'], ['0', '1', '0']}"
