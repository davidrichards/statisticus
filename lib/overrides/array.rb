class Array
  def to_sym
    map {|a| a.to_s.underscore.to_sym }
  end
  
  alias :single_include? :include?
  # Adjusted to see if all values are included.
  def include?(*args)
    args.inject(true) {|val, x| val = self.single_include?(x)}
  end
  
end
