require 'date'
class Date
  
  HOLIDAYS = [
    {:day => 'New Years Day',        :week => nil,  :day => 1,    :wday => nil,   :month => 1},
    {:day => 'Martin Luther King',   :week => 3,    :day => nil,  :wday => 1,     :month => 1},
    {:day => 'Presidents Day',       :week => 3,    :day => nil,  :wday => 1,     :month => 2},
    {:day => 'Memorial Day',         :week => 0,    :day => nil,  :wday => 1,     :month => 5},
    {:day => 'Independence Day',     :week => nil,  :day => 4,    :wday => nil,   :month => 7},
    {:day => 'Labor Day',            :week => 1,    :day => nil,  :wday => 1,     :month => 9},
    {:day => 'Columbus Day',         :week => 2,    :day => nil,  :wday => 1,     :month => 10},
    {:day => 'Veterans Day',         :week => nil,  :day => 11,   :wday => nil,   :month => 11},
    {:day => 'Thanksgiving Day',     :week => 4,    :day => nil,  :wday => 4,     :month => 11},
    {:day => 'Christmas',            :week => nil,  :day => 25,   :wday => nil,   :month => 12}
  ]
  
  def bank_holiday?
    # not a bank holiday if the current day is Sat or Sun
    return false if weekend?
    
    # select the holidays from the current month being requested
    days = HOLIDAYS.select { |holiday| holiday[:month] == self.mon }
    
    # if approaching the new year, get the holidays for it.
    if self.mon == 12 && (self.day > 30 && self.day <= 31)
      days << HOLIDAYS.select { |holiday| holiday[:month] == 1 }
      days.flatten!
    end
    
    # return false if there is no holidays for the requested month
    return false unless days
    
    # set our flag
    holiday = false
    
    # iterate over the days
    days.each do |day|
      
      if day[:day]
        current_holiday = Date.parse("#{determine_new_years(day)}/#{day[:month]}/#{day[:day]}")

        # if holiday day is the same as the current day, it's a holiday
        if (self.to_s == current_holiday.to_s)
          holiday = true
        else
          # check if the holiday is a sat or sun
          holiday = true if (self.to_s == weekend_holiday(current_holiday).to_s)
        end
      
      # day is null, check if week is null
      elsif day[:week]
        holiday = true if (self.to_s == get_specific_day_of_month(day).to_s)
      end
      
    end
    
    holiday
  end
  
  # get a specific day of the month: e.g. last monday of May
  def get_specific_day_of_month(day)
    if day[:week] == 0
      current_holiday = last_day_of_the_month.wday == day[:wday] ? last_day_of_the_month : last_day(day, last_day_of_the_month)
    elsif day[:week]
      first_weekday   = first_day_of_the_month(day[:wday], beginning_of_the_month)
      current_holiday = move_weeks_ahead(day[:week], first_weekday)
    end
    current_holiday
  end
  
  
  # Determine if the year needs bumping forward
  def determine_new_years(day)
    (day[:day] == 1 && day[:month] == 1) && self.mon == 12 ? self.year + 1 : self.year
  end
  
  
  # get a date object for the first of the month
  def beginning_of_the_month
    @beginning_of_the_month ||= Date.parse("#{self.year}/#{self.mon}/01")
  end
  
  
  # get a date object of the last day of the month
  def last_day_of_the_month
    if self.mon == 12
      next_month  = 1
      year        = self.year + 1
    else
      next_month  = self.mon + 1
      year        = self.year
    end
    @last_day_of_the_month ||= Date.parse("#{year}/#{next_month}/01") - 1
  end
  
  
  # determine if it's a weekend and either bring back or move forward to a weekday
  def weekend_holiday(holiday)
    case holiday.wday
    when 6  # move holiday back 1 day
      holiday - 1
    when 0  # move holoday foward 1 day
      holiday + 1
    else
      holiday
    end
  end
  
  
  def last_day(day, last_day_of_the_month)
    (last_day_of_the_month + (day[:wday] - last_day_of_the_month.wday))
  end
  
  def move_weeks_ahead(weeks, beginning_of_the_month)
    beginning_of_the_month + (7 * (weeks - 1))
  end
  
  
  def first_day_of_the_month(first_day, beginning_of_the_month)
    
    # get the days required to move ahead to the requested day
    move_ahead_by = if beginning_of_the_month.wday > first_day
      7 - (beginning_of_the_month.wday - first_day)
    elsif beginning_of_the_month.wday <  first_day
      first_day - beginning_of_the_month.wday
    elsif beginning_of_the_month.wday == first_day
      0
    end
    
    # add the move ahead days to the current date
    beginning_of_the_month + move_ahead_by
    
  end
  
  def next_business_day
    next_day = self + 1
    return next_day if next_day.is_business_day?
    until next_day.is_business_day?
      next_day = next_day + 1
    end
    next_day
  end
  
  
  def is_business_day?
    self.weekday? && !self.bank_holiday?
  end
  
  
  def monday?
    self.wday == 1
  end
  
  def tuesday?
    self.wday == 2
  end
  
  def wednesday?
    self.wday == 3
  end
  
  def thursday?
    self.wday == 4
  end
  
  def friday?
    self.wday == 5
  end
  
  def saturday?
    self.wday == 6
  end
  
  def sunday?
    self.wday == 0
  end
  
  def weekday?
    [1,2,3,4,5].include?(self.wday)
  end
  
  def weekend?
    [6,0].include?(self.wday)
  end
end