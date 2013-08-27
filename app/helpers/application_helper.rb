module ApplicationHelper

  WDAY_LIST = %i(sun mon tue wed thu fri sat)

  def make_wday_html_class(date_or_time)
    case date_or_time
    when Date, Time
      wday = date_or_time.to_date.wday
      WDAY_LIST[wday]
    else
      return
    end
  end

  def swipebox(image_url, thumb_image_url, html_options = {})
    html_options = html_options.stringify_keys
    html_options.delete 'swipebox'
    title = html_options.delete 'swipebox_title'
    swipebox_class = html_options.delete('swipebox_class') || 'swipebox'
    image_tag = image_tag thumb_image_url, html_options
    link_tag = link_to image_tag, image_url, class: swipebox_class, 'data-skip-pjax' => true, title: title
    link_tag
  end
end
