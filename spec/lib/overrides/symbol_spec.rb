require File.join(File.dirname(__FILE__), "/../../spec_helper")

describe Symbol do
  it "should have a shortcut for to_proc" do
    [1,2,3].map(&:succ).should eql([2,3,4])
  end
  
  it "should have [], which is a method to call :some_method on SomeObject" do
    creator = :new[Array]
    
    # Longhand
    creator.call.should be_is_a(Array)
    creator.call.should be_empty

    creator.call.object_id.should_not eql(creator.call.object_id)
    
    # Shorthand
    [creator].should be_is_a(Array)
    
    # Parameters
    class A
      def initialize(value)
        @value = value
      end
      attr_accessor :value
    end
    builder = :new[A]
    builder.call(1).value.should eql(1)
    builder.call(2).value.should eql(2)
    Object.send(:remove_const, :A)
  end
  
  it "should have []=, which is a method to create a method on some object" do
    o = Object.new
    o.should_not be_respond_to(:my_method)
    :my_method[o] = lambda {'my method'}
    o.my_method.should eql('my method')
  end
end