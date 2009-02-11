module Statisticus #:nodoc:
  
  # Deciding to put together a series of methods, and seamlessly bring it
  # into the R world. 
  module StandardLibrary
    
    # Methods good for Enumerable classes
    module EnumerableMethods
      include RUtility

      def sample(*args)
        r.sample(self, *args)
      end
      
      def summary
        r.summary(self)
      end
      
      def t_test(opts={})
        r.t_test(self, opts)
      end
    end
    
    module ScalarMethods #:nodoc:
      # include RUtility
      
      # use r_eval????
      
      # def rnorm(val)
      #   RSRuby.instance.rnorm(val)
      # end
      # puts 'ccccccccccccccc', rnorm(10).inspect

      # def seq(val)
      #   r.seq(val)
      # end
      # 
      # def rep(val)
      #   r.rep(val)
      # end
      
    end
    
  end
end

class Array
  include Statisticus::StandardLibrary::EnumerableMethods
end

include Statisticus::StandardLibrary::ScalarMethods

# def rnorm(val)
#   RSRuby.instance.rnorm(val)
# end
# puts 'ccccccccccccccc', rnorm(10).inspect
# puts 'ddddddddddddd', defined?(rnorm)

# puts RSRuby.instance.aov([1,2,3], [2,3,4]).inspect
# instead: one ~ another


# puts rnorm(10).inspect

# Not good enough: 
# 2-sided t-test
# Kolmogorov-Smirnov
# http://www.math.ilstu.edu/dhkim/Rstuff/Rtutor.html
# All the scalar stuff, why is it stack-level too deep?
# linear regression



# harmonic, trimmed, and geometric mean
# z-score (http://www.cyclismo.org/tutorial/R/pValues.html)
# Poisson

# puts 'these seem to be almost ok, except some of the t-test stuff', 'aaaaaaaaaaaaa', [1,2,3].t_test.inspect, [1,2,3].t_test(:mu => 2.5).inspect, [1,2,3].t_test(:equal => 't').inspect
