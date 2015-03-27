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
