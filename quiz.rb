#1. Name what each of the below is:
  a = 1
    (local variable)
  @a = 2
    (instance variable)
  user = User.new
    (new instance of a class)
  user.name
    (=> the object user is calling the name getter instance method)
  user.name = "Joe"
    (=> the object user is calling the name setter instance method, resetting the objects name string value to "Joe")

#2. How does a class mixin a module?
  include ClassName

#3. What's the difference between class variables and instance variables?
  A class variable is shared among the class and all of its descendants. It also begins with two @@ symbols. An instance variable is not shared by the class
   descendants and it begins with one @ symbol

#4. What does attr_accessor do?
  creates both reader and writter methods

#5. How would you describe this expression: Dog.some_method
  Dog class calling a class method.

#6. In Ruby, what's the difference between subclassing and mixing in modules?
  Modules = Mixing in modules is called composition and it is when classes has a relationship. This is usually when classes have multiple inheritances or when certain behaviors are shared among classes, but not every single one of them.
  subclassing = Subclassing is when the classes is a relationship and has a single inheritance. For example, a Dog subclass will inherit all of the behaviors of  an Animal superclass.

#7. Given that I can instantiate a user like this: User.new('Bob'), what would the initialize
#method look like for the User class?
  class User
    initialize(name)
      self.name = name
    end
  end

#8. Can you call instance methods of the same class from other instance methods in that class?
  Yes

#9. When you get stuck, what's the process you use to try to trap the error?
  Use binding.pry / include 'pry'
