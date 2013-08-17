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

  def swipebox(image_url, thumb_image_url, html_options = {})
    html_options = html_options.stringify_keys
    html_options.delete 'swipebox'
    title = html_options.delete 'swipebox_title'
    image_tag = h.image_tag thumb_image_url, html_options
    link_tag = h.link_to image_tag, image_url, class: 'swipebox', 'data-skip-pjax' => true, title: title
    link_tag
  end
end
