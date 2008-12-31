module Statisticus #:nodoc:
  class FileLoader
    
    include RUtility # Show up as instance methods
    extend RUtility # Show up as class methods
    
    def initialize(filename)
      @filename = filename
      r.class_table['data.frame'] = lambda{|x| DataFrame.new(x)}
      RSRuby.set_default_mode(RSRuby::CLASS_CONVERSION)
    end
    
    def get
      @filename ||= r.read_table(@filename, :header => true)
    end
    
    def self.get(filename)
      r.read_table(filename, :header => true)
    end
    
  end
end