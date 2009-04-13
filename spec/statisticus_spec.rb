require File.dirname(__FILE__) + '/spec_helper'

describe "Statisticus" do
  
  it "should require rubygems" do
    defined?(Gem).should eql('constant')
  end
  
  it "should require activesupport" do
    defined?(ActiveSupport).should eql('constant')
  end
  
  it "should require rsruby" do
    defined?(RSRuby).should eql('constant')
  end
  
  it "should require log4r" do
    defined?(Log4r).should eql('constant')
  end
  
  context 'Log4r' do
    it "should have Log for access to Log4r" do
      defined?(Statisticus::Log).should eql('constant')
    end
    
    it "should implement Log4r::Logger" do
      Statisticus::Log.should be_is_a(Log4r::Logger)
    end
    
    it "should send data to stderr (for now)" do
      Statisticus::Log.outputters.first.should be_is_a(Log4r::StderrOutputter)
    end
  end

  context "r_code" do
    
    before(:all) do
      class A
        include Statisticus
      end
    end
    
    before(:each) do
      @a = A.new
    end
    
    it "should be able to use r_code if it is set explicitly" do
      @a.r_code = "my_sum <- function(x) sum(x)"
      @a.r_code.should eql("my_sum <- function(x) sum(x)")
    end
    
    it "should be able to read r_code from a file_name, if it is set." do
      file_name = File.expand_path(File.join(File.dirname(__FILE__), %w(.. features steps r_lib geometric_mean.r)))
      @a.file_name = file_name
      @a.r_code.should eql(File.read(file_name))
    end
    
    it "should infer r_code from the class name" do
      @a.r_code.should eql('a <- function(x) sum(x)')
    end
    
    it "should initialize any functions being defined" do
      @a.should_receive(:init_r).and_return(true)
      @a.r_code
    end
    
    after(:all) do
      Object.send(:remove_const, :A)
    end
  end
  # I've got a lot more testing here, to make sure things stay in place.
  # I need to work on constraints a little, so that I can define functions
  # in the R runtime, that I can handle things like geometric_mean. 
  
end
