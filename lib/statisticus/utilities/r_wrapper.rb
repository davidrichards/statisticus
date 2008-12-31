module Statisticus #:nodoc:

  class RLoadError < StandardError; end
  class NotImplemented < StandardError; end
  
  # This is a general class meant to wrap about any R code available.  It
  # has a simple interface: run(opts={}).  Subclasses will do any
  # parameter checking and signature declaration, but the basic input is
  # always :data => SomeDataStore. 
  class RWrapper
    
    include RUtility
    extend RUtility
    
    R_LIBS = File.join(STATISTICUS_ROOT, "statisticus", "r_lib")
    
    attr_reader :error
    
    VALID_OPTIONS = [:list, :lib]
    DEFAULT_OPTIONS = {:lib => nil}

    def initialize(opts={})
      opts.convert_keys_to_symbols
      opts.infuse_with! DEFAULT_OPTIONS

      @r_lib = opts[:lib]
      @list = opts[:list]
      @list1 = opts[:list1] || opts[:list]
      @list2 = opts[:list2]
        
      load_r_lib
    end
    
    # This gets implemented in the subclasses.
    def run
      raise NotImplemented, "You need to subclass RWrapper and implement the run function, combining data to libraries"
    end
    
    def self.run
      raise NotImplemented, "You need to subclass RWrapper and implement the run function, combining data to libraries"
    end

    # Find the R, and load it.  It's important that you don't put
    # destructive code in your libs.  Reserve that for your runtime use of
    # the libs. A lib is NOT necessary, if it's already loaded in the R 
    # runtime.
    def load_r_lib
      valid_r?(r_lib)
    end
    private :load_r_lib
    
    def r_lib
      @r_lib ? @r_lib : file_contents
    end
    alias :as_r :r_lib
    
    def file_contents
      return false unless r_filename
      @contents ||= open(r_filename) { |f| f.read }
    end
    
    # This way this class can be sent directly to an R instance.
    def as_r
      file_contents
    end
    
    # Pass back the name of the file containing the R code, if it exists
    def r_filename
      return @r_filename if @r_filename
      stripped_name = self.class.name.split("::")[-1].underscore + ".r"
      r_filename = File.join(R_LIBS, stripped_name)
      @r_filename = r_filename if File.exist?(r_filename)
    end
    
    # For now, just accept the values...
    # Sets a variable in the 
    def infer_list(var_sym, list)
      r_eval("#{var_sym.to_s} <- #{list}")
    end
  end
end