module Statisticus #:nodoc:
  module RUtility #:nodoc:
    # Evaluates the contents of a string, assuming it's valid R.  If there
    # is a question, run this through valid_r? instead. 
    def r_eval(str)
      r.eval_R(str)
    end
    
    # This is a short-term fix for checking the syntax of your R code.  It
    # runs the code in the R runtime, so if your code is destructive to your
    # state space, beware. A better fix may be to auto-compile R libs into
    # add-on packages, checking their syntax before installing them.  This
    # method also evaluates the code, so if it passed, the code is ready in
    # the R runtime. 
    def valid_r?(str)
      begin
        r_eval(str)
      rescue Exception => e
        @error = e
        return false
      end
    end
    
    def r
      @r ||= RSRuby.instance
    end
    
  end
end