class HexSolution

  # INPUT: An array of test cases
  # OUTPUT: An array of answers regarding the passibility of those test cases.
  def solution test_cases
    result = []

    input = []
    test_cases.each { |el| input << el }

    test_case_quantity = input.shift.to_i

    test_case_quantity.times do
      grid_length = input.shift.to_i
      row1 = input.shift.chars
      row2 = input.shift.chars

      if (row1.count('1') + row2.count('1')).even? && clear?(row1, row2)
        result.push 'YES'
      else
        result.push 'NO'
      end
    end

    result.each { |answer| puts answer } # what about last one? newline char?
    result
  end

  private

  # INPUT: Two arrays
  # OUTPUT: boolean
  def clear?(row1, row2)
    top_black_indeces = []
    row1.each_with_index do |cell, index|
      if cell == '1'
        top_black_indeces << index
      end
    end

    # a 'slice' or 'splice' is when there is a black cell top-left of a black cell.
    top_black_indeces.each do |index|
      # illegal slice?
      if row2[index - 1] == '1'
        return false
      # legal slice?
      elsif row2[index] == '1'
        # Is there room to the left of the slice?
        if index != 0
          # puts "row1 => #{row1.to_s}"
          # puts "row1[index - 1] => #{row1[index - 1]}"
          left_grid = [row1[0..index - 1].join, row2[0..index - 1].join]
        else
          left_grid = ['0', '0']
          # WHERE DOES THE RIGHT GRID COME FROM?!!!
        end
        # Is there room to the right of the slice?
        if row1[index + 1] != nil
          right_grid = [row1[index + 1..-1].join, row2[index + 1..-1].join]
          # puts "right_grid: " + right_grid.to_s
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

end


derp = HexSolution.new
puts "herpnauts: " + (derp.solution ['1', '2', '10', '10'])[0]
