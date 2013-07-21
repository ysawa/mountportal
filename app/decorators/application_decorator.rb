class ApplicationDecorator < Draper::Decorator

  def formatted_date(date)
    if date
      date = date.to_date
      h.time_tag date, l(date)
    end
  end

  def formatted_time(time)
    if time
      time = time.to_time
      h.time_tag time, l(time)
    end
  end
end
