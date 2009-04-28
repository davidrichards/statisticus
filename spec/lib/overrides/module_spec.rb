require File.join(File.dirname(__FILE__), "/../../spec_helper")

describe Module do
  it "should have alias_method_chain" do
    class A
      def go
        'go'
      end
      def go_with_flair
        go_without_flair + " flair"
      end
      alias_method_chain :go, :flair
    end
    a = A.new
    a.go.should eql('go flair')
    a.go_without_flair.should eql('go')
    Object.send(:remove_const, :A)
  end
  
  it "should have [] aliased for instance_method" do
    String[:reverse].bind("hello").call.should eql("olleh")
  end
  
  it "should have []= setup to define an instance method" do
    String[:backwards] = lambda { reverse }
    "david".backwards.should eql('divad')
  end
  
  it "should have a safe way to define an instance method only if it isn't already set. (archive_method and alias_method_chain are useful here as well.)" do
    String[:backwards2] = lambda {reverse}
    a = "asdf"
    a.backwards2.should eql('fdsa')
    String.safe_def(:backwards2) { upcase }
    a.backwards2.should eql('fdsa')
  end
end