module Statisticus #:nodoc:
  STATISTICUS_ROOT = File.expand_path(File.dirname(__FILE__))
  # Set up a default logger for convenience.
  # require 'simple_logger'
  # Base.logger = SimpleLogger.new(STDOUT)
  
end

$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'rubygems'
require 'activesupport'
require 'rsruby'

require 'overrides'
require 'statisticus/utilities'
Dir.glob("#{File.dirname(__FILE__)}/statisticus/*.rb").each { |file| require file }




# Make a hash of r_libs.

# Get a DataFrame concept put together
# Bridge from Hash to DataFrame
module Statisticus

  def self.included(base)
    @@base = base
    # Involves distributed code, concurrent code, and of course composable code
    base.send(:include, TeguGears) if defined?(TeguGears)
  end
  
  # Makes base available.  We infer R libraries from the class name.
  def base
    @@base
  end
  
  attr_writer :r_code

  # In order, looks for r_code in 1) @r_code, 2) the file_name that has
  # been set, or 3) a file in the path that resembles the class name. 
  def r_code
    return @r_code if @r_code
    
    if self.file_name
      unless File.exist?(self.file_name)
        logger.warn "Had a filename set, but that file doesn't exist."
        return ''
      end
      @r_code ||= File.read(self.file_name)
    end
    
    @r_code ||= find_r_code_from_base_name
  end
  
  alias :r :r_code
  alias :r= :r_code=
  
  # This way the class can be passed directly to the R Runtime.
  alias :as_r :r_code
  
  # Can set a filename with R code in it
  attr_accessor :file_name

  protected
    attr_writer :path
    def path
      @path ||= %w(. ~/.statisticus).map {|path| File.expand_path(path)}.delete_if {|path| not File.exist?(path)}
    end
  
    # Returns an array suitable for Dir.glob
    def path_as_r_glob
      path.map {|p| "#{p}/**/#{self.base_as_r}"}
    end
  
    def base_as_r
      @base_as_r ||= self.base.to_s.underscore + ".r"
    end
  
    # Finds only the first file in the path that matches the base name.
    # E.g. a class called ZTest could be stores in ./**/z_test.r or ~/.statisticus/**/z_test.r
    # This returns the contents of any such file, if found.
    def find_r_code_from_base_name
      found_lib = Dir.glob(path_as_r_glob)
      found_lib ? File.read(found_lib) : nil
    end
    private :find_r_code_from_base_name
    
    def r_from_any_gem
      @r_from_any_gem ||= Gem.find_files("**/*.r")
    end
    
    def r_from_statisticus
    end
    
end

  