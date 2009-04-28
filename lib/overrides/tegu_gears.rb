module TeguGears::Memoize::InstanceMethods
  def function(*x)
    x = infer_r_values(*x)
    self.memoize ? memoized(*x) : process(*x)
  end
  
  def infer_r_values(*x)
    x.inject([]) { |list, e| list << infer_r_value(e) }
  end
  private :infer_r_values
  
  # Come up with any modifications that should be general and useful.  E.g.
  # , an array, when sent to an R function, will calculate the same method
  # for every value in the array.  R has an automatic conversion from a
  # range to an array (vector), and this implements the same concept from
  # Statisticus. 
  def infer_r_value(x)
    case x
    when Range
      x.to_a
    else
      x
    end
  end
end
