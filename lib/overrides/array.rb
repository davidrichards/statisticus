class Array
  def to_sym
    map {|a| a.to_s.underscore.to_sym }
  end
  
  def to_class
    map {|a| a.to_class }
  end
end