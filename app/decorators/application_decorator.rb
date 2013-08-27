class ApplicationDecorator < Draper::Decorator

  def current_user
    return @current_user if @current_user
    @current_user = h.current_user if defined?(h.current_user)
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
    !!current_user
  end
end
