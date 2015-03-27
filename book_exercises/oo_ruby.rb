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
