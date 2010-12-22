class Numeric
  def second
    self * 1
  end
  alias_method :seconds, :second
  
  def minute
    self * 60
  end
  alias_method :minutes, :minute
  
  def hour
    self * 3600
  end
  alias_method :hours, :hour
  
  def day
    self * (24 * 3600)
  end
  alias_method :days, :day
  
  def week
    self * (7 * 24 * 3600)
  end
  alias_method :weeks, :week
  
  def month
    self * (30 * 24 * 3600)
  end
  alias_method :months, :month
  
  def year
    self * (364.25 * 24 * 3600)
  end
  alias_method :years, :year
end