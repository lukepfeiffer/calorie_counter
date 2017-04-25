class Formatter
  def self.time(time)
    time.strftime("%l:%M %P")
  end

  def self.date(date)
    date.strftime("%B %e, %Y")
  end
end
