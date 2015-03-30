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
