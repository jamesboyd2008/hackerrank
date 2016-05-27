require './hexagonal_grid.rb'

describe HexSolution do

  hexy = HexSolution.new

  test1 = ['6', '6', '010000', '000010', '2', '00', '00', '2', '00', '10', '2',
          '00', '01', '2', '00', '11', '2', '10', '00']
  answer1 = ['YES', 'YES', 'NO', 'NO', 'YES', 'NO']

  test2 = ['4', '5', '00100', '01000', '11', '10000000000', '00000000000',
          '5', '00100', '10101', '4', '0010', '1011']
  answer2 = ['NO', 'NO', 'NO', 'NO']

  # [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  #   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]


  # [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  #   [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]


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

  # pick up here. question: splicey test case with back-to-back splices?

  splicey_tests = [
    splicey1[0], splicey1[1], splicey1[2],
    splicey2[0], splicey2[1], splicey2[2],
    splicey3[0], splicey3[1], splicey3[2],
    splicey4[0], splicey4[1], splicey4[2],
    splicey5[0], splicey5[1], splicey5[2],
    splicey6[0], splicey6[1], splicey6[2]
  ]

  splicey_tests.unshift splicey_tests.length / 3
  splicey_answers = ['YES', 'YES', 'NO', 'YES', 'NO', 'NO']

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
