require 'pry'

class Person
attr_accessor :name, :age, :health, :strength, :dead
MAX_HEALTH = 120

  def initialize(name, age, health = MAX_HEALTH, strength)
    @name = name
    @age = age
    @health = health
    @strength = strength
    @dead = false
  end
end

class Viking < Person
attr_accessor :name, :age, :health, :strength, :weapon, :dead

  def initilialize(name, age, health, strength, weapon)
    super(name, age, health, strength)
    @weapon = weapon
  end

  def attack(enemy)
    if enemy.dead
      puts "#{enemy.name} is already dead, bro!"
      return false
    end
    damage = (rand(10) + 10).round(0)
    enemy.take_damage(damage)
  end

protected

  def take_damage(damage)
    @health -= damage
    puts "#{self.name} took #{damage} damage and now has #{self.health} health"
    die if @health <= 0
  end

private

  def die
    puts "#{self.name} has been killed"
    self.dead = true
  end

end

dave = Viking.new("Dave", 12, 10)
drew = Viking.new("Drew", 27, 15)
10.times {dave.attack(drew)}

binding pry