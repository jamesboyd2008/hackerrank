input = []
STDIN.each { |num| input << num.to_i }


def prime? num
  j = 2
  i = num / j
  while i > 1
    if num % i == 0
      return 'Not prime'
    end
    j += 1
    i = num / j
  end

  if num == 1 || num < 2
    return 'Not prime'
  end

  'Prime'
end

input.slice(1..-1).each { |el| puts prime? el }
