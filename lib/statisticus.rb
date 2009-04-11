require 'rubygems'
require 'activesupport'
require 'rsruby'
require 'log4r'

require 'overrides'

# Make a hash of r_libs.

# Get a DataFrame concept put together
# Bridge from Hash to DataFrame
module Statisticus

  # Use log4r for my logging.
  Log = Log4r::Logger.new("statisticus")
  Log.add Log4r::Outputter.stderr

  # Safely require TeguGears
  begin
    require 'tegu_gears'
  rescue Exception => e
    Log.info "Could not load TeguGears"
  end

  module ClassMethods
    def signature(*args)
      # Use OpenStruct/Struct to get this constructed safely.  Basically, setup the percept here.
    end
    alias :percept_signature :signature
  end
  
  def self.included(base)
    @@base = base
    # Involves distributed code, concurrent code, and of course composable code
    base.send(:include, TeguGears) if defined?(TeguGears)
    base.send(:extend, ClassMethods)
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
        Log.warn "Had a filename set, but that file doesn't exist."
        return ''
      end
      @r_code ||= File.read(self.file_name)
    end
    
    @r_code ||= find_r_code_from_base_name
  end
  
  # The actual R runtime
  def r
    @r ||= RSRuby.instance
  end
  
  # This way the class can be passed directly to the R Runtime.
  alias :as_r :r_code
  
  # Can set a filename with R code in it
  attr_accessor :file_name

  protected
    attr_writer :path
    
    # Right now, grabs any R code from the current directory, in the 
    # ~/.statisticus directory, or in the gem itself. 
    def path
      @path ||= [".", "~/.statisticus", gem_r_lib].map {|path| File.expand_path(path)}.delete_if {|path| not File.exist?(path)}
    end
    
    # The directory in the gem itself that might contain some R code.
    def gem_r_lib
      File.expand_path(File.join(File.dirname(__FILE__), %w(.. r_lib)))
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

Dir.glob("#{File.dirname(__FILE__)}/statisticus/*.rb").each { |file| require file }


class A
  include Statisticus
end

@a = A.new