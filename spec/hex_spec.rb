require './hexagonal_grid.rb'

describe Hex_Solution do

  @tests = ["6", "6", "010000", "000010", "2", "00", "00", "2", "00", "10", "2",
    "00", "01", "2", "00", "11", "2", "10", "00"]
  @answers = ["YES", "YES", "NO", "NO", "YES", "NO"]

  it 'specs work' do
    expect(1).to eq(1)
  end

  it 'specs still work' do
    expect(1).not_to eq(2)
  end

  it "returns the correct results" do
    expect(solution(@tests)).to eq(@answers)
  end

end
