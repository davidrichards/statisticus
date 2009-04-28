class Module
  # Stolen wholesale out of active_support.  I didn't want the whole gem
  # in this gem. 
  def alias_method_chain(target, feature)
    # Strip out punctuation on predicates or bang methods since
    # e.g. target?_without_feature is not a valid method name.
    aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1
    yield(aliased_target, punctuation) if block_given?

    with_method, without_method = "#{aliased_target}_with_#{feature}#{punctuation}", "#{aliased_target}_without_#{feature}#{punctuation}"

    alias_method without_method, target
    alias_method target, with_method

    case
      when public_method_defined?(without_method)
        public target
      when protected_method_defined?(without_method)
        protected target
      when private_method_defined?(without_method)
        private target
    end
  end
  
  # Moves a method safely into a new name, only if it exists.  The default
  # name is original_#{method_name}.  So, archive_method(:x) creates
  # original_x as a method, and removes x, so that a module can then use
  # the x method name for something else.  To be honest, I'm not really
  # sure why I can't create a new method without overriding the old one,
  # it seems like it used to work, and I may have something boinked in my
  # system, but it's late and I could be wrong too. 
  def archive_method(target, new_name=nil)
    new_name ||= ("original_" + target.to_s).to_sym
    begin
      alias_method(new_name, target)
      
      case
        when public_method_defined?(target)
          public new_name
        when protected_method_defined?(target)
          protected new_name
        when private_method_defined?(target)
          private new_name
      end
      
      remove_method(target)
    rescue
      # The instance_methods show that the soon-to-be-defined methods are
      # defined before they are, really weird.  Need to see if this is a
      # problem with 1.9.  For now, fail silently.
    end
  end
  
  # Access instance methods with array notation. Returns UnboundMethod,
  alias [] instance_method
  
  # Define a instance method with name sym and body f.
  # Example: String[:backwards] = lambda { reverse }
  def []=(sym, f)
    self.instance_eval { define_method(sym, f) }
  end
  alias :save_lambda :[]=
  
  # Only defines the method if it hasn't been defined before.  It's a call
  # for monkey patching, instead of gorilla patching. 
  def safe_def(sym, &block)
    return true if self.instance_methods.include?(sym.to_s)
    self.[]=(sym, block)
  end
end
