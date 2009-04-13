require File.join(File.dirname(__FILE__), "/../../spec_helper")

describe Hash do
  it "should infuse_with defaults" do
    h = {:this => :that}.infuse_with({:this => 1, :that => 1})
    h[:this].should eql(:that)
  end
end


# class Hash
#   # Maybe I need some aliases so that this makes more sense.
#   # But, an infusion enhances or adds to the base.  This method
#   # will usually be used in the initialize methods of classes,
#   # or in similar circumstances.  Here, it is important to keep
#   # the explicit parameters, but to infuse them with some
#   # defaults.
#   def infuse_with(defaults)
#     unless respond_to?(:symbolize_keys) and respond_to?(:reverse_merge)
#       raise "Cannot infuse hash, try requiring active_support first" 
#     end
#     self.symbolize_keys.reverse_merge(defaults)
#   end
# 
#   # This is the destructive version of infuse_with.  
#   def infuse_with!(defaults)
#     unless respond_to?(:symbolize_keys) and respond_to?(:reverse_merge!)
#       raise "Cannot infuse hash, try requiring active_support first" 
#     end
#     self.symbolize_keys!
#     self.reverse_merge!(defaults)
#   end
# 
#   # This is intended to make reading named parameters a little
#   # more consistent between different classes: after calling
#   # this, just expect the keys to be symbols instead of any
#   # other class.
#   def convert_keys_to_symbols
#     Hash[ *self.collect { |k,v| [ k.to_s.tr('-','_').to_sym, v ] }.flatten ]
#   end
#   
#   # Just a helper method to make it easier to prune a hash.
#   # This works for an array of keys, but Ruby asks for a little
#   # more explicit syntax in that case:
#   # h = {:this => :that, 1 => 2}
#   # h.-(:this, 1) # Returns {}
#   # Don't forget, this is a destructive script.
#   def -(*keys)
#     keys.each {|k| self.delete(k)}
#     self
#   end
#   
#   # This is the non-destructive way to exclude some keys in
#   # ahash.  I think I've seen other, more clever ways to write
#   # this method, but it gets the job done.
#   def except(*keys)
#     h = self.dup
#     h.-(*keys)
#     h
#   end
#   
# end
