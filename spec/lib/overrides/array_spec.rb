require File.join(File.dirname(__FILE__), "/../../spec_helper")

describe Array do
  it "should be able to use a list of parameters for include?" do
    [1,2,3].include?(1, 2).should be_true
  end
  
  it "should be able to convert values to symbols" do
    %w(one two three).to_sym.should eql([:one, :two, :three])
  end
    
end