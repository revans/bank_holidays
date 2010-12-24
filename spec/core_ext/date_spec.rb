require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Date do
  
  describe "Next Business Day" do
    let(:saturday)  { Date.parse('2010/12/4') }
    let(:sunday)    { Date.parse('2010/12/5') }
    let(:christmas) { Date.parse('2010/12/25')}
  end
  
  describe "Bank Holidays" do
    before(:all) do
      @labor_day_2010             = Date.parse('2010/9/6')
      @labor_day_2011             = Date.parse('2011/9/5')
                                  
      @columbus_day_2010          = Date.parse('2010/10/11')
      @columbus_day_2011          = Date.parse('2011/10/10')
                                  
      @memorial_day_2010          = Date.parse('2010/5/31')
      @memorial_day_2011          = Date.parse('2011/5/30')
                                  
      @presidents_day_2010        = Date.parse("2010/2/15")
      @presidents_day_2011        = Date.parse("2011/2/21")
                                  
      @martin_luther_king_2010    = Date.parse('2010/01/18')
      @martin_luther_king_2011    = Date.parse('2011/01/17')
                                  
      @new_years_day_2010         = Date.parse("2010/1/1")
      @new_years_day_2011         = Date.parse("2011/1/1")
                                  
      @christmas_2010             = Date.parse("2010/12/25")
      @christmas_2011             = Date.parse('2010/12/25')
                                  
      @fourth_of_july_2011        = Date.parse('2011/7/4')
      @fourth_of_july_2010        = Date.parse('2010/7/4')
                                  
      @veterans_day_2010          = Date.parse('2010/11/11')
      @veterans_day_2011          = Date.parse('2011/11/11')
      
      @day_before_new_years_2011  = Date.parse("2010/12/31")
      @day_after_new_years_2011   = Date.parse("2011/1/3")
      
      @day_before_new_years_2012  = Date.parse("2012/12/31")
      @day_after_new_years_2012   = Date.parse("2012/01/2")
      
      @day_before_christmas_2010  = Date.parse('2010/12/24')
      
      @no_holiday                 = Date.parse("2011/10/01")
    end
    
    it "should be a holiday for the day before new years, 2010" do
      @day_before_new_years_2011.bank_holiday?.should be_true
    end
    
    it "should return false for the day before New Years 2012" do
      @day_before_new_years_2012.bank_holiday?.should be_false
    end
    
    it "should return true for the day after New Years 2012" do
      @day_after_new_years_2012.bank_holiday?.should be_true
    end

    it "should return false for the day after New Years 2011" do
      @day_after_new_years_2011.bank_holiday?.should be_false
    end
    
    it "should be a holiday for the day before Christmas, 2010" do
      @day_before_christmas_2010.bank_holiday?.should be_true
    end
    
    it "should be false when testing for no holiday" do
      @no_holiday.bank_holiday?.should be_false
    end
    
    
    it "should return true for Labor Day 2010" do
      @labor_day_2010.bank_holiday?.should be_true
    end
    
    it "should return true for Labor Day 2011" do
      @labor_day_2011.bank_holiday?.should be_true
    end
    
    it "should return true for Columbus Day 2010" do
      @columbus_day_2010.bank_holiday?.should be_true
    end
    
    it "should return true for Columbus Day 2011" do
      @columbus_day_2011.bank_holiday?.should be_true
    end
    
    it "should return true for Memorial Day 2010" do
      @memorial_day_2010.bank_holiday?.should be_true
    end
    
    it "should return true for Memorial Day 2011" do
      @memorial_day_2011.bank_holiday?.should be_true
    end
    
    it "should return true for Martin Luther King 2010" do
      @martin_luther_king_2010.bank_holiday?.should be_true
    end
    
    it "should return true for Martin Luther King 2011" do
      @martin_luther_king_2011.bank_holiday?.should be_true
    end
    
    it "return true for New Years day 2010" do
      @new_years_day_2010.bank_holiday?.should be_true
    end
    
    it "return false (weekend) for New Years day 2011" do
      @new_years_day_2011.bank_holiday?.should be_false
    end
    
    it "should return true for Veteran's Day 2010" do
      @veterans_day_2010.bank_holiday?.should be_true
    end
    
    it "should return true for Veteran's Day 2011" do
      @veterans_day_2011.bank_holiday?.should be_true
    end
    
    it "should return true for President's Day 2010 being a bank holiday" do
      @presidents_day_2010.bank_holiday?.should be_true
    end
    
    it "should return true for President's Day 2011 being a bank holiday" do
      @presidents_day_2011.bank_holiday?.should be_true
    end
    
    it "should return false for Christmas 2010 being a bank holiday" do
      @christmas_2010.bank_holiday?.should be_false
    end
    
    it "should return false for Christmas 2011 being a bank holiday" do
      @christmas_2011.bank_holiday?.should be_false
    end
    
    it "should return false (weekend) for 4th of July 2010 being a bank holiday" do
      @fourth_of_july_2010.bank_holiday?.should be_false
    end
    
    it "should return false for 4th of July 2011 being a bank holiday" do
      @fourth_of_july_2011.bank_holiday?.should be_true
    end
  end
  
  describe "Weekdays" do
    before(:all) do
      @weekday = Date.parse("2010/12/21")
      @weekend = Date.parse("2010/12/19")
    end
    
    it "should return true when asked if it is a weekday" do
      @weekday.weekday?.should be_true
    end
    
    it "should return false when asked if it is a weekday" do
      @weekend.weekday?.should be_false
    end
  end
  
  describe "Weekends" do
    before(:all) do
      @weekday = Date.parse("2010/12/21")
      @weekend = Date.parse("2010/12/19")
    end
    
    it "should return false when asked if it is a weekday" do
      @weekday.weekend?.should be_false
    end
    
    it "should return true when asked if it is a weekday" do
      @weekend.weekend?.should be_true
    end
  end
  
  describe "Days of the week" do
    before(:all) do
      @today  = Date.parse("2010/12/20")
      @sunday = Date.parse("2010/12/12")
    end
    
    it "should return true when asked if it is monday" do
      @today.monday?.should be_true
    end
    
    it "should return false when asked if it is tuesday" do
      @today.tuesday?.should be_false
    end
    
    it "should return false when asked if it is wednesday" do
      @today.wednesday?.should be_false
    end
    
    it "should return false when asked if it is thursday" do
      @today.thursday?.should be_false
    end
    
    it "should return false when asked if it is friday" do
      @today.friday?.should be_false
    end
    
    it "should return false when asked if it is saturday" do
      @today.saturday?.should be_false
    end
    
    it "should return false when asked if it is sunday" do
      @today.sunday?.should be_false
    end
    
    it "should return true when testing for sunday" do
      @sunday.sunday?.should be_true
    end
    
  end
  
end