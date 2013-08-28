class ApplicationDecorator < Draper::Decorator

  def current_user
    h.current_user
  end

  def formatted_date(date, html_options = {})
    if date
      date = date.to_date
      format = html_options.delete('format')
      h.time_tag date, l(date, format: format), html_options
    end
  end

  def formatted_time(time, html_options = {})
    if time
      time = time.to_time
      only_time = html_options.delete('only_time')
      if only_time
        format = html_options.delete('format') || :hour_minute
        text = l(time, format: format)
      else
        format = html_options.delete('format')
        text = l(time, format: format)
      end
      h.time_tag time, text, html_options
    end
  end

  def user_signed_in?
    h.user_signed_in?
  end
end
