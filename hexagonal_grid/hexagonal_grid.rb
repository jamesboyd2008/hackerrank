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
      if (row1.count('1') + row2.count('1')).odd?
        result.push 'NO'
      elsif clear?(row1, row2)
        result.push 'YES'
      else
        result.push 'NO'
      end
    end

    result
  end

  # INPUT: Two arrays.
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
