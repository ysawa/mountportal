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
      only_time = html_options.delete('only_time')
      if only_time
        text = l(time, format: :hour_minute)
      else
        text = l(time)
      end
      h.time_tag time, text, html_options
    end
  end
end
