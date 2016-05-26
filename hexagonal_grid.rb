# Enter your code here. Read input from STDIN. Print output to STDOUT
# STDIN.each { |el| puts el.class } # => They're all strings.
# STDOUT = [] # => don't do this, b/c STDOUT is already defined

result = []

input = []
STDIN.each { |el| input << el }

test_case_quantity = input.shift.to_i

test_case_quantity.times do
    grid_length = input.shift
    row1 = input.shift.chars
    row2 = input.shift.chars

    # r = red, m = maroon, y = yellow

    i, j = 0, 0
    while i < row1.length && j < row2.length
        # james, pick up here. Loop an assessment algorithm, which starts with i top-left of j. Both cells unassessed.
        do
            # Is the first cell of the top row black?
            if row1[i] == 1
                i += 1
                # Is there a black cell top-left of another black cell?
                if row2[j] == 1
                    result.push "NO"
                end
                # It's black top-left of clear.
                j += 1
                if row2[j] == 1
                    result.push "NO"
                end
                # Lay a lower yellow (really imaginary, by incrementing j thusly)
                j += 1
                # Now it's black top-left, yellow lower-right
                # Is it [1, 1] ?
                #         [y, y]
                if row1[i] == 1
                    i += 1
                    break # Start loop over. Whoo-hoo!

                # Is it [1, 0...] ?
                #         [y, y...]
                elsif

                end
            # It's a NOGO.
            else
                result.push "NO"
            end
        end
        # increment i and j somewhere
    end


end

# STDOUT is just whatever you puts
result.each { |answer| puts answer } # what about last one? newline char?
