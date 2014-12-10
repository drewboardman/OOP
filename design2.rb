require 'pry'

class Bmi
  attr_reader :people
  Person = Struct.new(:height, :weight)

  def initialize(data)
    @people = bmiify(data)
  end

  def bmi
    people.map {|person| (person.weight/person.height.to_f**2)*703}
  end

  def bmiify(data)
    data.map {|height, weight| Person.new(height,weight)}
  end
end

students = Bmi.new([[71, 165], [67, 178], [59, 210], [78, 250]])
puts students.bmi

def exponents(numbers)
  numbers.map { |number| square(number)  }
end

def square(number)
  number**2
end

arr = [1,2,3,4,5]
p exponents(arr)
binding pry