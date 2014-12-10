require 'pry'

class Person
MAX_HEALTH = 120
attr_accessor :name, :age, :health, :strength
  def initialize(name, age, health, strength)
    @name = name
    @age = age
    @health = health
    @strength = strength
  end

  def heal
        self.health += 1 unless self.health + 1 > MAX_HEALTH
  end

end

class Viking < Person
attr_accessor :name, :age, :health, :strength, :weapon

  def initialize(name, age, health, strength, weapon)
    super(name, age, health, strength)
    @weapon = weapon
  end

  def self.create_warrior(name)
    name = name
    age = rand*20 +15
    health = [age*5,120].min
    strength = [(age / 2),10].min
    Viking.new(name, age, health, strength)
  end

  def self.random_name
    ["Erikson", "Lars", "Leif"].sample
  end

  def self.silver_to_gold(silver_pieces)
    silver_pieces/10
  end

  def self.gold_to_silver(gold_pieces)
    gold_pieces * 10
  end

  def attack(enemy)
    enemy.take_damage(rand(20))
  end

  def take_damage(damage)
    self.health -= damage
    self.shout("OUCH!")
  end

  def shout(phrase)
    puts phrase
  end

  def sleep(hours)
    self.health += (1*hours) unless self.health >= 99
  end

  def heal
    2.times { super }
    puts "#{@name} has healed"
    puts "Health: #{@health}"
  end

end
oleg = Viking.new("Oleg", 19, 100, 8)
erik = Viking.new("Erik", 19, 100, 8)
sven = Viking.create_warrior("Sven")
dolf = Viking.create_warrior("Dolf")

binding pry