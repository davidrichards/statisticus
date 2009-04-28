require File.join(File.dirname(__FILE__), "/../../spec_helper")

describe TeguGears do
  it "should convert a Range to an Array" do
    class A
      include Statisticus
      def process(x)
        x
      end
    end
    A.call(1..3).should eql([1,2,3])
    
  end
end