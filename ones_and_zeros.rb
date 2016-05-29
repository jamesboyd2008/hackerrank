# INPUT: an integer, N.
# OUTPUT: all the possible hexagonal grid arrangements according to
# https://www.hackerrank.com/challenges/hexagonal-grid of length N.
def possibilities n, previous_arrangements
  return "Your input isn't good enough" if n < 1 || n.class != Fixnum

  possible_arrangements = previous_arrangements

  if n == 1
    possible_arrangements << ['1', '1', '1', '1', '0', '0',
                              '1', '1', '0', '1', '0', '1']
    possible_arrangements.unshift((possible_arrangements.length / 3).to_s)
    return possible_arrangements
  end


  all_cells = Array.new n * 2
  indeces = all_cells.clone



  possible_arrangements.push n.to_s
  possible_arrangements.push('top row')
  possible_arrangements.push('bottom row')

  return possibilities n - 1, possible_arrangements
end
