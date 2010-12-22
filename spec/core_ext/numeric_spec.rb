require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Numeric do
  
  it "should handle 1.second" do
    1.second.should == 1
  end
  
  it "should handle 1 minute" do
    1.minute.should == 60
  end
  
  it "should handle 1 hour" do
    1.hour.should == 3600
  end
  
  it "should handle 1 day" do
    1.day.should == 86400
  end
  
  it "should handle 1 week" do
    1.week.should == 604800
  end
  
  it "should handle 1 month" do
    1.month.should == 2592000
  end
  
  it "should handle 1.year" do
    1.year.should == 31471200.0
  end
end