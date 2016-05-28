require './hexagonal_grid.rb'

describe HexSolution do

  hexy = HexSolution.new

  test1 = ['6', '6', '010000', '000010', '2', '00', '00', '2', '00', '10', '2',
          '00', '01', '2', '00', '11', '2', '10', '00']
  answer1 = ['YES', 'YES', 'NO', 'NO', 'YES', 'NO']

  test2 = ['4', '5', '00100', '01000', '11', '10000000000', '00000000000',
          '5', '00100', '10101', '4', '0010', '1011']
  answer2 = ['NO', 'NO', 'NO', 'NO']

  # [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  #   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]


  # splicey8row1 = [1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
  #   splicey8row2 = [1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]

  splicey1row1 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  splicey1row2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  splicey1 = [splicey1row1.length.to_s, splicey1row1.join, splicey1row2.join]

  splicey2row1 = [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  splicey2row2 = [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  splicey2 = [splicey2row1.length.to_s, splicey2row1.join, splicey2row2.join]

  splicey3row1 = [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  splicey3row2 = [0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  splicey3 = [splicey3row1.length.to_s, splicey3row1.join, splicey3row2.join]

  splicey4row1 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  splicey4row2 = [0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  splicey4 = [splicey4row1.length.to_s, splicey4row1.join, splicey4row2.join]

  splicey5row1 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]
  splicey5row2 = [0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  splicey5 = [splicey5row1.length.to_s, splicey5row1.join, splicey5row2.join]

  splicey6row1 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]
  splicey6row2 = [0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
  splicey6 = [splicey6row1.length.to_s, splicey6row1.join, splicey6row2.join]

  splicey7row1 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1]
  splicey7row2 = [0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1]
  splicey7 = [splicey7row1.length.to_s, splicey7row1.join, splicey7row2.join]

  splicey8row1 = [1, 0, 0, 0]
  splicey8row2 = [1, 0, 0, 0]
  splicey8 = [splicey8row1.length.to_s, splicey8row1.join, splicey8row2.join]

  splicey9row1 = [1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
  splicey9row2 = [1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
  splicey9 = [splicey9row1.length.to_s, splicey9row1.join, splicey9row2.join]

  splicey10row1 = [1, 1]
  splicey10row2 = [1, 1]
  splicey10 = [splicey10row1.length.to_s, splicey10row1.join, splicey10row2.join]

  splicey11row1 = [1]
  splicey11row2 = [1]
  splicey11 = [splicey11row1.length.to_s, splicey11row1.join, splicey11row2.join]


  # question: splicey test case with back-to-back splices?

  # REMEMBER: N <= 10. Pass the tests, you have, then write&pass tests that take N into account.

  splicey_tests = [
    splicey1[0], splicey1[1], splicey1[2],
    splicey2[0], splicey2[1], splicey2[2],
    splicey3[0], splicey3[1], splicey3[2],
    splicey4[0], splicey4[1], splicey4[2],
    splicey5[0], splicey5[1], splicey5[2],
    splicey6[0], splicey6[1], splicey6[2],
    splicey7[0], splicey7[1], splicey7[2],
    splicey8[0], splicey8[1], splicey8[2],
    splicey9[0], splicey9[1], splicey9[2],
    splicey10[0], splicey10[1], splicey10[2],
    splicey11[0], splicey11[1], splicey11[2]
  ]

  splicey_tests.unshift (splicey_tests.length / 3).to_s
  splicey_answers = ['YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'NO', 'NO']

  it 'returns the correct results' do
    expect(hexy.solution(test1)).to eq(answer1)
  end

  it 'returns a tricky result' do
    expect(hexy.solution(test2)).to eq(answer2)
  end

  it 'solves splicey grids' do
    expect(hexy.solution(splicey_tests)).to eq(splicey_answers)
  end

end
