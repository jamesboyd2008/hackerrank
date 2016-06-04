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


  splicey1row1 = [0, 0, 0, 0, 0, 1, 0, 0, 0, 0]
  splicey1row2 = [0, 0, 0, 0, 0, 1, 0, 0, 0, 0]
  splicey1 = [splicey1row1.length.to_s, splicey1row1.join, splicey1row2.join]

  splicey2row1 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0]
  splicey2row2 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0]
  splicey2 = [splicey2row1.length.to_s, splicey2row1.join, splicey2row2.join]

  splicey3row1 = [0, 0, 0, 1, 0, 0, 1, 0, 0, 0]
  splicey3row2 = [0, 1, 0, 1, 0, 0, 1, 0, 0, 0]
  splicey3 = [splicey3row1.length.to_s, splicey3row1.join, splicey3row2.join]

  splicey4row1 = [0, 1, 0, 0, 0, 0, 1, 0, 0, 0]
  splicey4row2 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0]
  splicey4 = [splicey4row1.length.to_s, splicey4row1.join, splicey4row2.join]

  splicey5row1 = [0, 0, 1, 0, 0, 0, 1, 0, 1, 0]
  splicey5row2 = [0, 0, 0, 1, 0, 0, 1, 0, 0, 0]
  splicey5 = [splicey5row1.length.to_s, splicey5row1.join, splicey5row2.join]

  splicey6row1 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0]
  splicey6row2 = [0, 1, 0, 0, 0, 0, 1, 0, 0, 0]
  splicey6 = [splicey6row1.length.to_s, splicey6row1.join, splicey6row2.join]

  splicey7row1 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 1]
  splicey7row2 = [0, 0, 0, 1, 0, 0, 1, 0, 0, 1]
  splicey7 = [splicey7row1.length.to_s, splicey7row1.join, splicey7row2.join]

  splicey8row1 = [1, 0, 0, 0]
  splicey8row2 = [1, 0, 0, 0]
  splicey8 = [splicey8row1.length.to_s, splicey8row1.join, splicey8row2.join]

  splicey9row1 = [1, 0, 1, 0, 0, 0, 1, 1, 0, 0]
  splicey9row2 = [1, 0, 0, 1, 0, 0, 1, 1, 0, 0]
  splicey9 = [splicey9row1.length.to_s, splicey9row1.join, splicey9row2.join]

  splicey10row1 = [1, 1]
  splicey10row2 = [1, 1]
  splicey10 = [splicey10row1.length.to_s, splicey10row1.join, splicey10row2.join]

  splicey11row1 = [1]
  splicey11row2 = [1]
  splicey11 = [splicey11row1.length.to_s, splicey11row1.join, splicey11row2.join]

  splicey12row1 = []
  splicey12row2 = []
  splicey12 = [splicey12row1.length.to_s, splicey12row1.join, splicey12row2.join]

  splicey13row1 = [0]
  splicey13row2 = [0]
  splicey13 = [splicey13row1.length.to_s, splicey13row1.join, splicey13row2.join]

  splicey14row1 = [1]
  splicey14row2 = [0]
  splicey14 = [splicey14row1.length.to_s, splicey14row1.join, splicey14row2.join]

  splicey15row1 = [0]
  splicey15row2 = [1]
  splicey15 = [splicey15row1.length.to_s, splicey15row1.join, splicey15row2.join]

  # check for t and n
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
    splicey11[0], splicey11[1], splicey11[2],
    # splicey12[0], splicey12[1], splicey12[2],
    splicey13[0], splicey13[1], splicey13[2],
    splicey14[0], splicey14[1], splicey14[2],
    splicey15[0], splicey15[1], splicey15[2],
  ]

  splicey_tests.unshift (splicey_tests.length / 3).to_s
  splicey_answers = ['YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES','YES',#10 on this line
     'YES', 'YES', 'NO', 'NO']


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
    'NO', 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'NO',
    'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'NO', 'NO',
    'NO', 'NO', 'YES', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO',
    'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES',
    'NO', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'YES',
    'YES', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES',
    'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'NO',
    'NO', 'NO', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO',
    'NO', 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'NO', 'YES',
    'YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'YES', 'NO', 'NO', 'NO',
    'NO', 'NO', 'YES', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO', 'NO',
    'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES',
    'YES', 'YES', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES',
    'NO', 'NO', 'YES', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO',
    'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'YES',
    'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO', 'YES',
    'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES', 'NO', 'YES',
    'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES',
    'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES',
    'YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES',
    'NO', 'YES', 'NO', 'NO', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES',
    'NO', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'NO',
    'YES', 'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES',
    'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES',
    'NO', 'YES', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES',
    'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'YES', 'YES',
    'NO', 'YES', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES']



  it 'returns the correct results' do
    expect(hexy.solution(test1)).to eq(answer1)
  end

  it 'returns a tricky result' do
    expect(hexy.solution(test2)).to eq(answer2)
  end

  it 'solves splicey grids' do
    expect(hexy.solution(splicey_tests)).to eq(splicey_answers)
  end

  it 'solves hackerrank TestCase #3' do
    expect(hexy.solution(case_3)).to eq(case_3_answer)
  end

  it 'doesnt mis-identify isolated zeros' do
    expect(hexy.isolated_zero? ['1', '1', '1'], ['1', '1', '1']).to eq(false)
  end

  it 'identifies isolated zeros' do
    expect(hexy.isolated_zero? ['0', '1', '1'], ['1', '1', '1']).to eq(true)
    expect(hexy.isolated_zero? ['1', '0', '1'], ['1', '1', '1']).to eq(true)
    expect(hexy.isolated_zero? ['1', '1', '0'], ['1', '1', '1']).to eq(true)
    expect(hexy.isolated_zero? ['1', '1', '1'], ['0', '1', '1']).to eq(true)
    expect(hexy.isolated_zero? ['1', '1', '1'], ['1', '0', '1']).to eq(true)
    expect(hexy.isolated_zero? ['1', '1', '1'], ['1', '1', '0']).to eq(true)
  end

  context 'when a zero is barely isolated' do
    it 'still outs it' do
      expect(hexy.isolated_zero? ['1', '0', '1'], ['1', '1', '0']).to eq(true)
      expect(hexy.isolated_zero? ['0', '1', '1'], ['1', '0', '1']).to eq(true)
      expect(hexy.isolated_zero? ['1', '1', '0'], ['0', '1', '1']).to eq(true)
      expect(hexy.isolated_zero? ['0', '1', '0'], ['1', '1', '1']).to eq(true)
    end
  end

  context 'when just one zero is barely isolated amongst unisolated zeros' do
    it 'still does the deed' do
      expect(hexy.isolated_zero? ['0', '1', '1'], ['0', '1', '0']).to eq(true)
    end
  end

  # two_by_twos = []
  #
  #
  #
  # two_by_twos.unshift (two_by_twos.length / 3).to_s
  # two_by_twos_answer = ['YES']
  # context ' when assessing a 2x2 hex grid ' do
  #   it 'does it right' do
  #     expect(hexy.solution(two_by_twos)).to eq('')
  #   end
  # end


  # this didn't work because the spec didn't run until the loop was done
  # i, j = 1, 0
  # while i < test_data.length
  #   grid_length = test_data[i].to_s
  #   row1 = test_data[i + 1]
  #   row2 = test_data[i + 2]
  #   test_case = ['1', grid_length, row1, row2]
  #   it "solves test_data case #{j}" do
  #     expect(hexy.solution(test_case)).to eq(test_data_answer[j])
  #   end
  #   i += 3
  #   j += 1
  # end

  it 'solves N from 5 to 3' do
    expect(hexy.solution(test_data)).to eq(test_data_answer)
  end

end
