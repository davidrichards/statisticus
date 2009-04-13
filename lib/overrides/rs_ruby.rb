class RSRuby
  class << self
    # def RSRuby.convert_method_name(name)
    #   if name.length > 1 and name[-1].chr == '_' and name[-2].chr != '_'
    #     name = name[0..-2]
    #   end
    #   name.gsub!(/__/,'<-')
    #   name.gsub!(/_/, '.')
    #   return name
    # end
    alias :orig_convert_method_name :convert_method_name
    
    def convert_method_name(name)
      if name.length > 1 and name[-1].chr == '_' and name[-2].chr != '_'
        name = name[0..-2]
      end
      name.gsub!(/__/,'<-')
      # Want to be able to have variable names like geometric_mean.
      # Pass in . if I mean .
      return name
    end
    
  end
end
