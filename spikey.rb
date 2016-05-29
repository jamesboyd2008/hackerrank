# Impossible grids:

  # Any grid with an odd number of black cells

  # [0, 0, 0, 1, 0, 0, 0]
  #   [0, 0, 1, 0, 0, 0, 0]
  # The one above is impossible because of the odd number of cells to the left of
  # the black blockade.

  # handle legal diagonal slice
  # [0, 0, 1, 0, 0]
  #   [1, 0, 1, 0, 1]

  # legal diagonal slice creates problems on both sides.
  # [0, 0, 1, 0]
  #   [1, 0, 1, 1]



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

    result.each { |answer| puts answer } # what about last one? newline char?
    result
  end

  private

  # INPUT: Two arrays. There is an even number of '1' in the combined arrays.
  # OUTPUT: boolean
  def clear?(row1, row2)

    top_black_indeces = []
    row1.each_with_index do |cell, index|
      if cell == '1'
        top_black_indeces << index
      end
    end

    top_black_indeces.each do |index|
      # forward slash?

      # [0, 0, 0, 1, 0, 1, 1]
      #   [0, 0, 1, 0, 0, 1, 0]

      # IF a forward slash occurs,
      # AND there exists EITHER
      # an odd number of open cells OR
      # an even number of ones
      # (should one of these conditions occur, so will the other)
      # THEN it's a NOGO.

      # account for forward slash
      if row2[index - 1] == '1' #&& row1[index - 1] != '1'
        if (row1[0..index - 1].count('0') + row2[0..index - 2].count('0')).odd? ||
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

end


  case_3 = ['100','4','1001','1100','4','0111','0010','4','1000','0011','4',
    '0110','0111','4','0100','0000','4','1001','1000','4','1000','1101','4',
    '1001','1101','4','1100','0110','4','1101','0011','4','1110','0011','4',
    '0111','1001','4','0010','0111','4','1011','0011','4','0110','1110','4',
    '1110','0111','4','1100','0100','4','1011','0001','4','1100','1101','4',
    '1101','0110','4','1111','1100','4','0101','1011','4','1001','0001','4',
    '1010','1111','4','1011','0010','4','1101','0011','4','0110','1010','4',
    '1010','1101','4','1100','1011','4','1001','0101','4','0011','1101','4',
    '0111','0100','4','0000','0101','4','0000','0111','4','0000','0001','4',
    '0110','1011','4','0100','1001','4','0100','0110','4','0111','1011','4',
    '1001','0011','4','1011','1111','4','0010','0100','4','0010','0000','4',
    '0110','0000','4','1101','0010','4','0000','1110','4','0100','1101','4',
    '1000','0100','4','0110','0100','4','1000','1011','4','1000','1101','4',
    '1111','0101','4','0000','0101','4','1001','0100','4','1001','0100','4',
    '1011','1001','4','0011','0000','4','0111','1010','4','1001','1010','4',
    '1001','0000','4','0100','0101','4','1001','0011','4','1100','1111','4',
    '1110','0110','4','1111','0010','4','0110','0111','4','1011','0011','4',
    '0111','0110','4','1100','1111','4','1110','1001','4','1000','1111','4',
    '1001','1111','4','1000','1011','4','1000','0111','4','1011','0011','4',
    '0110','0100','4','0100','0110','4','1011','0000','4','0010','1111','4',
    '0101','1110','4','0100','1110','4','0001','1001','4','0011','1100','4',
    '1101','1001','4','0100','0111','4','1100','0010','4','0111','0011','4',
    '0010','1010','4','0010','1111','4','0010','0010','4','1001','0111','4',
    '1010','1111','4','0100','0100','4','0010','0011','4','1111','1100','4',
    '0000','1011','4','0001','1100','4','1111','1010','4','0110','1001','4',
    '1011','0101']

  case_3_answer = ['YES','NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'YES','NO' ,'NO' ,'NO' ,
                   'NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'YES','NO' ,'NO' ,
                   'YES','NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'YES',
                   'NO' ,'YES','YES','NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'YES',
                   'NO' ,'NO' ,'NO' ,'YES','NO' ,'NO' ,'NO' ,'YES','NO' ,'YES',
                   'YES','NO' ,'YES','NO' ,'NO' ,'NO' ,'YES','NO' ,'NO' ,'YES',
                   'NO' ,'YES','YES','NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'YES','NO' ,
                   'NO' ,'YES','YES','YES','NO' ,'NO' ,'NO' ,'NO' ,'NO' ,'NO' ,
                   'NO' ,'NO' ,'YES','NO' ,'YES','NO' ,'NO' ,'NO' ,'NO' ,'YES',
                   'NO' ,'NO' ,'YES','NO' ,'YES','NO' ,'NO' ,'NO' ,'NO' ,'NO' ]


answers = HexSolution.new.solution(case_3)

i = 0
j = 1
while i < answers.length
  if answers[i] != case_3_answer[i]
    puts "Me: #{answers[i]}, It: #{case_3_answer[i]}"
    puts "test: #{i}"
    puts "row1: #{case_3[i * 3 + 2].chars.to_s}"
    puts "row2:   #{case_3[i * 3 + 3].chars.to_s}"
    j += 1
  end
  i += 1
end
puts "j: #{j}"

puts "I succeeded: #{answers == case_3_answer}"
# puts "twiggles: #{twiggles[0]}"
