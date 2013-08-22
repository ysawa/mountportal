class TrekDecorator < ApplicationDecorator
  delegate_all

  def picture(html_options = {})
    html_options = html_options.stringify_keys
    if model.picture? && model.picture.image?
      if html_options['swipebox']
        if h.request.smart_phone?
          image_url = model.picture.image.middle.url
        else
          image_url = model.picture.image.url
        end
        unless html_options['swipebox_title']
          html_options['swipebox_title'] = picture_caption
        end
        image_tag = h.swipebox(image_url, model.picture.image.thumb.url, html_options)
      else
        image_tag = h.image_tag model.picture.image.thumb.url, html_options
      end
    else
      image_tag = h.image_tag 'treks/trek.png', html_options
    end
    image_tag
  end

  def published
    if model.published?
      h.content_tag :span, I18n.t('statuses.published'), class: 'label'
    else
      h.content_tag :span, I18n.t('statuses.unpublished'), class: 'label alert'
    end
  end

  def scheduled_from
    formatted_time(model.scheduled_from)
  end

  def scheduled_from_date
    formatted_date(model.scheduled_from_date)
  end

  def scheduled_to
    formatted_time(model.scheduled_to)
  end

  def scheduled_to_date
    formatted_date(model.scheduled_to_date)
  end

private
  def picture_caption
    if model.name
      name = h.truncate(model.name, length: 10)
    else
      ''
    end
  end
end
