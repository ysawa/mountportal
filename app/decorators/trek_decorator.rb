class TrekDecorator < ApplicationDecorator
  delegate_all

  def picture(html_options = {})
    html_options = html_options.stringify_keys
    if model.picture? && model.picture.image?
      if html_options['swipebox']
        html_options.delete 'swipebox'
        title = html_options.delete 'swipebox_title'
        image_tag = h.image_tag model.picture.image.thumb.url, html_options
        image_tag = h.link_to image_tag, model.picture.image.url, class: 'swipebox', 'data-skip-pjax' => true, title: title
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
end
