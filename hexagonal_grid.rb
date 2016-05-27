# Enter your code here. Read input from STDIN. Print output to STDOUT
# STDIN.each { |el| puts el.class } # => They're all strings.
# STDOUT = [] # => don't do this, b/c STDOUT is already defined
class Hex_Solution
  def solution test_cases
    result = []

    input = []
    test_cases.each { |el| input << el } # Change test_cases to STDIN for submission.

    test_case_quantity = input.shift.to_i

    test_case_quantity.times do
      grid_length = input.shift
      row1 = input.shift.chars
      row2 = input.shift.chars

      # r = red, m = maroon, y = yellow
      # 1 = black, 0 != black

      i, j = 0, 0
      if (row1.count("1") + row2.count("1")).even?
        # Check for corner cases. IF none are met, THEN:

        result.push "YES"
      else
        result.push "NO"
      end

        # Checking only for the impossible scenarios (assuming they are finite)
        # IF none are found, push "YES" into result.
        # ELSE push "NO" into result.
        # Impossible scenarios are as follows:
        # These 4 scenarios don't work
        #   [0, 0]     [0, 0]     [1, 0]     [0, 1]
        #     [1, 0]     [0, 1]     [0, 0]     [0, 0]

        # Now I'm wondering if there just has to be an even number of black cells
        # dispersed in any fashion other than the corner cases...
        # Must write some tests!

      result
    end

    # STDOUT is just whatever you puts
    result.each { |answer| puts answer } # what about last one? newline char?
    result
  end
end
