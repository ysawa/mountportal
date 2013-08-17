class CommentDecorator < ApplicationDecorator
  delegate_all

  def acted_at
    if model.acted_at
      formatted_time model.acted_at, class: 'acted_at'
    end
  end

  def figure_image(html_options = {})
    html_options = html_options.stringify_keys
    if model.figure? && model.figure.image?
      if html_options['swipebox']
        image_tag = swipebox(model.figure.image.url, model.figure.image.small.url, html_options)
      else
        image_tag = h.image_tag model.figure.image.small.url, html_options
      end
      image_tag
    end
  end
end
