require 'pry'

class Mammal
  def heartbeat?
    true
  end

end

class Dog < Mammal
attr_accessor :name

  def initialize(name)
    @name = name
  end

  def bark
    return("Ruff Ruff!")
  end

end

spot = Dog.new("Spot")
puts spot.heartbeat?


class Lamp
  def self.about_me
    return "We turn on."
  end
end

class WaterBottle
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def return_size
    return @size
  end
end

fido = Dog.new("Fido")
puts fido.bark
puts Lamp.about_me
figi = WaterBottle.new("16 ozer")
puts figi.return_size

module Clueless
  def funny
    return("AS IF?!")
  end
end

class Actress
  include Clueless
end

alicia = Actress.new()
puts alicia.funny

module MathHelper
  def multiply_by_two(number)
    return number*2
  end

  def exponent(x, y)
    (x.to_f)**y
  end
end

class Calculator
  include MathHelper
  def square_root(x)
    exponent(x, 0.5)
  end
end

puts "the square root of 9 is #{Calculator.new().square_root(9)} "

class Homework
  include MathHelper
end
puts Homework.new().multiply_by_two(2)

class BaseballPlayer
  attr_accessor :hits, :walks, :at_bats

  def initialize(hits, walks, at_bats)
    @hits = hits.to_f
    @walks = walks.to_f
    @at_bats = at_bats.to_f
  end

  def batting_average
    batting_average = (@hits/@at_bats).to_f
  end

  def on_base_percentage
    ((@hits + @walks)/@at_bats).to_f
  end
end

babe = BaseballPlayer.new(2,0,3)
puts "batting average is #{babe.batting_average}"
puts "on base percentage is #{babe.on_base_percentage}%"

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end

doug_baldwin = Person.new("Doug", "Baldwin")
puts doug_baldwin.full_name

binding pry