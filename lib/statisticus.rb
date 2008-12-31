module Statisticus #:nodoc:

  # Set up a default logger for convenience.
  require 'simple_logger'
  Base.logger = SimpleLogger.new(STDOUT)
  
end

Dir.glob("#{File.dirname(__FILE__)}/statisticus/**/*.rb").each { |file| require file }
