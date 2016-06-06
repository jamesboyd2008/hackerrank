# Impossible grids:
  # Any grid with an odd number of black cells

# r = red, m = maroon, y = yellow
# 1 = black, 0 = empty

class HexSolution

  # INPUT: An array of test cases
  # OUTPUT: An array of answers regarding the passibility of those test cases.
  def solution test_cases
    result = []

    input = []
    test_cases.each { |el| input << el.chomp }

    test_case_quantity = input.shift.to_i

    test_case_quantity.times do |iteration|
      grid_length = input.shift.to_i
      row1 = input.shift.chars
      row2 = input.shift.chars

      # check for empty all
      # make the finite test cases, accounting for previous checks and n <= 10

      if (row1.count('1') + row2.count('1')).odd?
        result.push 'NO'
      elsif clear?(row1, row2)
        result.push 'YES'
      else
        result.push 'NO'
      end
    end

    # result.each { |answer| puts answer } # what about last one? newline char?
    result
  end

  # private

  # INPUT: Two arrays. There is an even number of '1' in the combined arrays.
  # OUTPUT: boolean
  def clear?(row1, row2)

    return false if isolated_zero? row1, row2

    top_black_indeces = []
    row1.each_with_index do |cell, index|
      if cell == '1'
        top_black_indeces << index
      end
    end

    top_black_indeces.each do |index|
      # forward slash?

      # 1, 1, 0, 1, 1
      #   1, 0, 0, 1, 0

      # account for forward slash
      if row2[index - 1] == '1' && index > 0
        # account for forward slash cornering a 1 (a GO situation)
        if index == 1
          return false if row1.first == '0'
        elsif (row1[0..index - 1].count('0') + row2[0..index - 2].count('0')).odd? ||
          (row1[index + 1..-1].count('0') + row2[index..-1].count('0')).odd?
          return false
        end
      end
      # backslash?
      if row2[index] == '1'
        # Is there room to the left of the slice?
        if index != 0
          left_grid = [row1[0..index - 1].join, row2[0..index - 1].join]
        else
          left_grid = ['0', '0']
        end
        # Is there room to the right of the slice?
        if row1[index + 1] != nil
          right_grid = [row1[index + 1..-1].join, row2[index + 1..-1].join]
        else
          right_grid = ['0', '0']
        end

        left_passibility = solution(['1', (index + 1).to_s,
          left_grid[0], left_grid[1]])[0]

        right_passibility = solution(['1', (row1.length - (index + 1)).to_s,
          right_grid[0], right_grid[1]])[0]

        if left_passibility == "NO" || right_passibility == "NO"
          return false
        end
      end
    end

    true
  end

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


    row1_indeces.each do |index|
      # Is the zero isolated?

      if ((row1[index - 1] == '1' && index > 0) || index == 0) &&
         (row1[index + 1] == '1' || index == row1.length - 1) &&
         row2[index] == '1' &&
         (row2[index - 1] == '1' || index == 0)
        return true
      end
    end

    row2_indeces.each do |index|
      if ((row2[index - 1] == '1' && index > 0) || index == 0) &&
         (row2[index + 1] == '1' || index == row2.length - 1) &&
         row1[index] == '1' &&
         (row1[index + 1] == '1' || index == row1.length - 1)
        return true
      end
    end

    false
  end

end

# [1, 1, 1, 1, 0]
#   [1, 1, 1, 1, 0]

# puts HexSolution.new.solution ['1', '5', '11110', '11101']

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

test_data = []

i = 1
while i < n_from_5_to_3.length
  row1 = n_from_5_to_3[i].chars
  # puts n_from_5_to_3[i + 1]
  row2 = n_from_5_to_3[i + 1].chars
  if (row1.count('1') + row2.count('1')).even?
    test_data << n_from_5_to_3[i - 1] << row1.join << row2.join
  end
  i += 3
end

test_data.unshift (test_data.length / 3).to_s

# CSV.open('test_data.csv', 'wb') do |csv|
#   result.each do |element|
#     csv << [element]
#   end
# end


test_data_answer = ['YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'YES',
  'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO',
  'YES', 'NO', 'NO', 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES',
  'NO', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO', 'NO', 'NO', 'YES', 'NO', 'NO',
  'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO',
  'NO', 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', #last one here is 64
  'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'NO', #75
  'NO', 'NO', 'NO', 'YES', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES']#, #86
  # 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES',
  # 'NO', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'YES',
  # 'YES', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES',
  # 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'NO',
  # 'NO', 'NO', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO',
  # 'NO', 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'NO', 'YES',
  # 'YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'YES', 'NO', 'NO', 'NO',
  # 'NO', 'NO', 'YES', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO', 'NO',
  # 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES',
  # 'YES', 'YES', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES',
  # 'NO', 'NO', 'YES', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO',
  # 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'YES',
  # 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO', 'YES',
  # 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO', 'YES',
  # 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES',
  # 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES',
  # 'YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES',
  # 'NO', 'YES', 'NO', 'NO', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES',
  # 'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'NO',
  # 'YES', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES',
  # 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES',
  # 'NO', 'YES', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES',
  # 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES',
  # 'NO', 'YES', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES']

wrongness = 0
hexy = HexSolution.new
test_data.shift
test_data_answer.length.times do |grid|
  length = test_data.shift
  row1 = test_data.shift
  row2 = test_data.shift
  test_case = ['1', length, row1, row2]
  if hexy.solution(test_case).first == test_data_answer[grid]
    correctness = ''
  else
    wrongness += 1
    correctness = 'WROOÖOOOOOOOOONNNNGGG'
  end
  puts "grid: #{grid + 1}, expected: #{test_data_answer[grid]}, got: #{hexy.solution(test_case)[0]}#{correctness}"
end

puts "wrongness: #{wrongness}"
