class Person
	def initialize(firstName, lastName, id)
		@firstName = firstName
		@lastName = lastName
		@id = id
	end
	def printPerson()
		print("Name: ",@lastName , ", ", @firstName ,"\nID: " , @id)
	end
end

class Student < Person
    def initialize(firstName, lastName, id, scores)
        super(firstName, lastName, id)
        @scores = scores
    end

    def calculate
        average = (@scores.inject(:+)) / @scores.length
        if average >= 90
            return 'O'
        elsif average >= 80
            return 'E'
        elsif average >= 70
            return 'A'
        elsif average >= 55
            return 'P'
        elsif average >= 40
            return 'D'
        else
            return 'T'
        end
    end
end

input = %w(Heraldo Memelli 8135627 2 100 80)
firstName = input[0]
lastName = input[1]
id = input[2].to_i
numScores = input[3].to_i
scores = input[4..-1].map!(&:to_i)
s = Student.new(firstName, lastName, id, scores)
s.printPerson
puts("\nGrade: " + s.calculate)
