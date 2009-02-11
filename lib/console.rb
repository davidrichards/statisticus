$:.unshift(File.dirname(__FILE__))

class Loader
  class << self
    def add_lib(name, &block)
      @@lib ||= {}
      @@lib[name] = self.safe_require(&block)
    end
    
    def libs_loaded
      @@lib.map {|k, v| k if v }.compact
    end
    
    def failed_libs
      @@lib.map {|k, v| k unless v }.compact
    end
    
    def safe_require(&block)
      begin
        yield
        true
      rescue
        false
      end
    end
  end
  
end

require 'rubygems'
# Does this even work???
Loader.add_lib('mathn') { require 'mathn'}
Loader.add_lib('matrix') { require 'matrix'}
Loader.add_lib('narray') { require 'narray'} # Also add enumerables here
Loader.add_lib('rnum') { require 'rnum'}
Loader.add_lib('rgl') { 
  require 'rgl/dot'
  require 'rgl/adjacency'
  require 'rgl/traversal'
  require 'rgl/topsort'
}
Loader.add_lib('rbtree') { require 'rbtree'}

# Loading seperately because these are not dependent on RsRuby
Loader.add_lib('enumerable_statistics') { 
  require 'statisticus/enumerable_statistics' 
} 

include Statisticus::ScalarStatistics if Loader.libs_loaded.include?('statistics')
include Statisticus::InterEnumerableStatistics if Loader.libs_loaded.include?('statistics')


Loader.add_lib('statisticus') { require 'statisticus' }
