#the_object_model

  # 1) How do we create an object in Ruby? Give an example of the creation of an object.

    class SuperAwesome
    end

    I_am = SuperAwesome.new

  # 2) What is a module?

  # A module is a collection of behaviors that is useable in other classes via mixins

    module AndFunny
    end

    class SuperAwesome
      include AndFunny
    end

    I_am = SuperAwesome.new

# classes_and_objects_part1

  # 1) Create a class called MyCar. When you initialize a new instance or object of the class,
  # allow the user to define some instance variables that tell us the year, color, and model
  # of the car. Create an instance variable that is set to 0 during instantiation of the object
  # to track the current speed of the car as well. Create instance methods that allow the car to
  # speed up, brake, and shut the car off.

    class MyCar

      def initialize(year, model, color)
        @year = year
        @model = model
        @color = color
        @current_speed = 0
      end

      def speed_up(number)
        @current_speed += number
        puts "You push the gas and accelerate #{number} mph."
      end

      def brake(number)
        @current_speed -= number
        puts "You push the brake and decelerate #{number} mph."
      end

      def current_speed
        puts "You are now going #{@current_speed} mph."
      end

      def shut_down
        @current_speed = 0
        puts "Let's park this bad boy!"
      end
    end

    ferrari = MyCar.new("1947", "red", "159 S")
    ferrari.speed_up(20)
    ferrari.current_speed
    ferrari.speed_up(20)
    ferrari.current_speed
    ferrari.brake(20)
    ferrari.current_speed
    ferrari.brake(20)
    ferrari.current_speed
    ferrari.shut_down
    ferrari.current_speed

    # 2) Add an accessor method to your MyCar class to change and view the color of your car.
      # Then add an accessor method that allows you to view, but not modify, the year of your car.

    class MyCar

      attr_accessor :color
      attr_reader :year

    ferrari.color = 'black'
    puts ferrari.color
    puts ferrari.year

    # 3) # You want to create a nice interface that allows you to accurately describe the action
    # you want your program to perform. Create a method called spray_paint that can be called
    # on an object and will modify the color of the car.

    def spray_paint(color)
      self.color = color
      puts "You new #{color} paint job looks great!"
    end

# classes_and_objects_part2

  # 1) Add a class method to your MyCar class that calculates the gas mileage of any car.
    class MyCar
      def self.gas_mileage(gallons, miles)
        puts "#{miles / gallons} miles per gallon of gas"
      end
    end

  # 2) Override the to_s method to create a user friendly print out of your object.
    class MyCar
      # code omitted for brevity...

      def to_s
        "My car is a #{self.color}, #{self.year}, #{@model}!"
      end
    end

    my_car = MyCar.new("2010", "Ford Focus", "silver")
    puts my_car  # => My car is a silver, 2010, Ford Focus.

    ## Note the "puts" calls "to_s" automatically.

  # 3) Solution:
    #We get this error because attr_reader only creates a getter method. When we try to reassign
    # the name instance variable to "Bob", we need a setter method called name=. We can get this
    # by changing attr_reader to attr_accessor or attr_writer if we don't intend to use the getter
    # functionality.

    class Person
      attr_accessor :name
      # attr_writer :name ## => This also works but doesn't allow getter access
      def initialize(name)
        @name = name
      end
    end

    bob = Person.new("Steve")
    bob.name = "Bob"

#classinheritance

  # 1)
  # Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior
  # that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class
  # that stores information about the vehicle that makes it different from other types of Vehicles.

  # Then create a new class called MyTruck that inherits from your superclass that also has a constant
  # defined that separates it from the MyCar class in some way.

    class Vehicle
      TYPE = "All Wheel Drive"
    end

    class MyCar < Vehicle
      COLOR = "Blue"

    end

    class MyTruck < Vehicle
      COLOR = "Red"
    end

  # 2)
  # Add a class variable to your superclass that can keep track of the number of objects created
  # that inherit from the superclass. Create a method to print out the value of this class variable as well.

  class Vehicle
    @@total_vehicles = 0

    def self.total_vehicles
      puts @@total_vehicles
    end

    def initialize
      total_vehicles += 1
    end

    def self.vehicle_type
      puts "All Wheel Drive"
    end
  end

  class MyCar < Vehicle
    COLOR = "Blue"

  end

  class MyTruck < Vehicle
    COLOR = "Red"
  end

  # 3) Create a module that you can mix in to ONE of your subclasses that describes a behavior
  # unique to that subclass.

    class Vehicle
      @@total_vehicles = 0

      def self.total_vehicles
        puts @@total_vehicles
      end

      def initialize
        total_vehicles += 1
      end

      def self.vehicle_type
        puts "All Wheel Drive"
      end
    end

    module SeatingRoom
      def number_of_seats
        puts 8
      end
    end

    class MyCar < Vehicle
      include SeatingRoom
      COLOR = "Blue"
    end

    class MyTruck < Vehicle
      COLOR = "Red"
    end

  # 4) Print to the screen your method lookup for the classes that you have created.
    class Vehicle
      @@total_vehicles = 0

      def self.total_vehicles
        puts @@total_vehicles
      end

      def initialize
        total_vehicles += 1
      end

      def self.vehicle_type
        puts "All Wheel Drive"
      end
    end

    module SeatingRoom
      def number_of_seats
        puts 8
      end
    end

    class MyCar < Vehicle
      include SeatingRoom
      COLOR = "Blue"
    end

    class MyTruck < Vehicle
      COLOR = "Red"
    end

    puts MyCar.ancestors
    puts MyTruck.ancestors
    puts Vehicle.ancestors

  #5) Move all of the methods from the MyCar class that also pertain to the MyTruck class into
  # the Vehicle class. Make sure that all of your previous method calls are working when you are finished.

    module Towable
      def can_tow?(pounds)
        pounds < 2000 ? true : false
      end
    end

    class Vehicle
      attr_accessor :color
      attr_reader :model, :year
      @@number_of_vehicles = 0

      def initialize(year, model, color)
        @year = year
        @model = model
        @color = color
        @current_speed = 0
        @@number_of_vehicles += 1
      end

      def speed_up(number)
        @current_speed += number
        puts "You push the gas and accelerate #{number} mph."
      end

      def brake(number)
        @current_speed -= number
        puts "You push the brake and decelerate #{number} mph."
      end

      def current_speed
        puts "You are now going #{@current_speed} mph."
      end

      def shut_down
        puts "Let's park this bad boy!"
      end

      def self.gas_mileage(gallons, miles)
        puts "#{miles / gallons} miles per gallon of gas"
      end

      def spray_paint(color)
        self.color = color
        puts "You new #{color} paint job looks great!"
      end
    end

    class MyTruck < Vehicle
      include Towable

      NUMBER_OF_DOORS = 2

      def to_s
        "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
      end
    end

    class MyCar < Vehicle
      NUMBER_OF_DOORS = 4

      def to_s
        "My car is a #{self.color}, #{self.year}, #{self.model}!"
      end
    end

    lumina = MyCar.new(1997, 'chevy lumina', 'white')
    lumina.speed_up(20)
    lumina.current_speed
    lumina.speed_up(20)
    lumina.current_speed
    lumina.brake(20)
    lumina.current_speed
    lumina.brake(20)
    lumina.current_speed
    lumina.shut_down
    MyCar.gas_mileage(13, 351)
    lumina.spray_paint("red")
    puts lumina
    puts MyCar.ancestors
    puts MyTruck.ancestors
    puts Vehicle.ancestors

  # 6) Write a method called age that calls a private method to calculate the age of the
  # vehicle. Make sure the private method is not available from outside of the class.
  # You'll need to use Ruby's built-in Time class to help.

    class Vehicle
    # code omitted for brevity...
      def age
        "Your #{self.model} is #{years_old} years old."
      end

      private

      def years_old
        Time.now.year - self.year
      end
    end

    puts lumina.age

  # 7) Create a class 'Student' with attributes name and grade. Do NOT make the grade
  # getter public, so joe.grade will raise an error. Create a better_grade_than? method,
  # that you can call like so...

    class Student
    def initialize(name, grade)
      @name = name
      @grade = grade
    end

    def better_grade_than?(other_student)
      grade > other_student.grade
    end

    protected

    def grade
      @grade
    end
    end

    joe = Student.new("Joe", 90)
    bob = Student.new("Bob", 84)
    puts "Well done!" if joe.better_grade_than?(bob)

  # 8) The problem is that the method hi is a private method, therefore it is unavailable
  # to the object. I would fix this problem by moving the hi method above the private reserved
  # word in the class.
