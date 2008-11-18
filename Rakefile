require 'rubygems'
require 'rake'
require 'echoe'
require 'lib/version'

Echoe.new('statisticus', Statisticus::VERSION) do |p|
  p.description              = "Generate a unique token with Active Record." 
  p.url                      = "http://github.com/davidrichards/statisticus" 
  p.author                   = "David Richards" 
  p.email                    = "drichards@showcase60.com" 
  p.ignore_pattern           = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
