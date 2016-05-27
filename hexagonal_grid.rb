# Impossible grids:

  # Any grid with an odd number of black cells

  # [0, 0, 0, 1, 0, 0, 0]
  #   [0, 0, 1, 0, 0, 0, 0]
  # The one above is impossible because of the odd number of cells to the left of
  # the black blockade.

  # pick up here.  Find a "NO" grid with an even number of black cells, without
  # positioning one top-right of the other.
  # [0, 0, 0, 0, 0, 0, 0]
  #   [0, 0, 0, 0, 0, 0, 0]

# r = red, m = maroon, y = yellow
# 1 = black, 0 != black

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

      if (row1.count("1") + row2.count("1")).even? && clear?(row1, row2)
        result.push "YES"
      else
        result.push "NO"
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
      if cell == "1"
        top_black_indeces << index
      end
    end

    top_black_indeces.each do |index|
      if row2[index - 1] == "1"
        return false
      end
    end

    true
  end

end
