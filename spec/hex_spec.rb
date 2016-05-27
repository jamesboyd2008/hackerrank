require './hexagonal_grid.rb'

describe HexSolution do

  hexy = HexSolution.new

  test1 = ["6", "6", "010000", "000010", "2", "00", "00", "2", "00", "10", "2",
          "00", "01", "2", "00", "11", "2", "10", "00"]
  answer1 = ["YES", "YES", "NO", "NO", "YES", "NO"]

  # [0, 0, 1, 0, 0]
  #   [0, 1, 0, 0, 0]
  test2 = ["1", "5", "00100", "01000"]
  answer2 = ["NO"]

  it "returns the correct results" do
    expect(hexy.solution(test1)).to eq(answer1)
  end

  it "returns a tricky result" do
    expect(hexy.solution(test2)).to eq(answer2)
  end

end
