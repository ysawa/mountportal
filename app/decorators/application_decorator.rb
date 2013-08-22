class ApplicationDecorator < Draper::Decorator

  def formatted_date(date, html_options = {})
    if date
      date = date.to_date
      h.time_tag date, l(date), html_options
    end
  end

  def formatted_time(time, html_options = {})
    if time
      time = time.to_time
      h.time_tag time, l(time), html_options
    end
  end
end
