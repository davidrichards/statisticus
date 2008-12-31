module Statisticus
  Statisticus::Initializer.run do |config|
    
    # I suspect this may evolve when it gets a few brain cells committed to
    # it, so we can adjust things from here. 
    # config.logger = Statisticus::SimpleLogger
    
    # List the location of all R libraries, defaults to only lib/r
    # config.r_libs = [DirFile.expand_path(File.join(File.dirname(__FILE__) %w(.. lib r)))]
    
    # If a Ruby class hasn't been defined to wrap an R file, auto generate one?
    # Default true
    # config.auto_generate_classes = true
    
  end
  
end