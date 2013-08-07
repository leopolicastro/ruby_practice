
class Student
  attr_accessor :scores, :first_name
  def initialize(first_name, scores)   #Use named arguments!
    @first_name = first_name
    @scores = scores
  end
  def letter_grade
    case average
    when 00..59 then "F"
    when 60..69 then "D"
    when 70..79 then "C"
    when 80..89 then "B"
    when 90..100 then "A"
    end
  end
  def average
    (@scores.inject(:+).to_f) / @scores.length
  end
end

#Here are some students!
alex = Student.new("Alex",[100,100,100, 0,100] )
john = Student.new("John", [50, 60, 70, 80, 80])
michael = Student.new("Michael", [60, 70, 70, 50, 40])
sarah = Student.new("Sarah", [40, 60, 20, 50, 70])
katie = Student.new("Katie", [90, 90, 90, 90, 90])
students = [alex, john, michael, sarah, katie]

def linear_search(students, target_name)
  students.each_with_index do |student, index|
    if student.first_name == target_name
      return index #once the loop returns, it exits the method
    end
  end
  return -1
end

#===========DRIVER CODE : DO NOT MODIFY =======

#Make sure these tests pass
# Tests for part 1:

p students[0].first_name == "Alex"
p students[0].scores.length == 5
p students[0].scores[0] == students[0].scores[4]
p students[0].scores[3] == 0

# p students[0].average == 80
p students[0].letter_grade == 'B'

# Tests for part 3

p linear_search(students, "Alex") == 0
p linear_search(students, "NOT A STUDENT") == -1
