class Symbol
  def to_proc
    lambda {|receiver, *args| receiver.method(self)[*args]}
  end

  # Add [] and []= operators to the Symbol class for accessing and setting
  # singleton methods of objects. Read : as "method" and [] as "of".
  # So :m[o] reads "method m of o".

  # Return the Method of obj named by this symbol. This may be a singleton
  # method of obj (such as a class method) or an instance method defined
  # by obj.class or inherited from a superclass.
  # Examples:
  #   creator = :new[Object]  # Class method Object.new
  #   doubler = :*[2]         # * method of Fixnum 2
  #
  def [](obj)
    obj.method(self)
  end
  
  # Define a singleton method on object o, using Proc or Method f as its body.
  # This symbol is used as the name of the method.
  # Examples:
  #
  #  :singleton[o] = lambda { puts "this is a singleton method of o" }
  #  :class_method[String] = lambda { puts "this is a class method" }
  # 
  # Note that you can't create instance methods this way. See Module.[]=
  #
  def []=(o,f)
    # We can't use self in the block below, as it is evaluated in the 
    # context of a different object. So we have to assign self to a variable.
    sym = self
    # This is the object we define singleton methods on.
    eigenclass = (class << o; self end)
    # define_method is private, so we have to use instance_eval to execute it.
    eigenclass.instance_eval { define_method(sym, f) }
  end
end
