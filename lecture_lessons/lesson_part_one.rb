# OOP in Ruby
#1. Classes and Objects
# classes are the cookie cutter, objects are the cookie
#2. classes contain behaviors
#3. Instance variables contain states
#4. Objects are instantiated from classes and contain states and behaviors
#5. class variables and methods
#6. compare with procedural

  class Dog
    attr_accessor :name, :height, :weight

    # attr_accessor :name replaces the following getter and setter methods..
    # def get_name
    #   @name
    # end

    # def set_name=(new_name)
    #   @name = new_name
    # end

    @@count = 0

    def self.total_dogs
      "total number of dogs: #{@@count}"
    end

    def initialize(n, h, w)
      @name = n
      @height = h
      @weight = w
      @@count += 1
    end

    def speak
      @name + "bark!"
    end

    def info
      "#{name} is #{height}ft tall and weighs #{weight}."
    end

    def update_info(n, h, w)
      self.name = n
      self.weight = h
      self.height = w
    end

  end

  teddy = Dog.new('teddy', 3, 95)
  puts teddy.info
  teddy.update_info('Roosevelt', 5, 125)
  puts teddy.info
  puts Dog.total_dogs

  # puts teddy.speak #teddy object contains speak behavior
  # puts teddy.info

  # teddy.name = "Roosevelt"
  # puts teddy.info
