class Animal
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def eat
    "#{name} eats food."
  end

  def speak
    "#{name} is speaking."
  end
end

class Mammal < Animal
  def warm_blooded?
    true
  end
end

# in order to use this module, your class must respond to a name method call
module Swimmable
  def swim
    "#{name} is swimming"
  end
end

class Dog < Mammal
  include Swimmable
  def fetch
    "#{name} is fetching!"
  end

  def speak
    "#{name} is barking."
  end
end

class Cat < Mammal
  def speak
    "#{name} is meowing."
  end
end

teddy = Dog.new('Teddy')
puts teddy.swim
# puts teddy.name
# puts teddy.fetch
# puts teddy.speak

# kitty = Cat.new('Kitty')
# puts kitty.name
# puts kitty.speak


