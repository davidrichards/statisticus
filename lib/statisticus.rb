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
