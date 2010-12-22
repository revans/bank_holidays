class Time
  
  def next_business_day
    n = self
    
    # Specific to an app I'm working on
    n = n + 1.day if n.hour > 13 && !n.friday?
    n = (n.hour > 13 && n.friday?) ? n + 5.days : n + 4.days
    
    # Check for Weekend or Holiday
    n = n + 3.days if n.saturday?
    n = n + 2.days if n.sunday?
    n = n + 1.day  if n.monday?     # Could be a holiday. Is there a better way to do this?

    n
  end
  
  def friday?
    self.wday == 5
  end
  
  def saturday?
    self.wday == 6
  end
  
  def sunday?
    self.wday == 7
  end
  
  def monday?
    self.wday == 1
  end
  
  def weekday?
    [1,2,3,4,5].include?(self.wday)
  end
  
end