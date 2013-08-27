class CommentDecorator < ApplicationDecorator
  delegate_all

  def acted_at(html_options = {})
    if model.acted_at
      html_options = html_options.stringify_keys
      html_options.reverse_merge!(
        'class' => 'acted_at'
      )
      formatted_time model.acted_at, html_options
    end
  end

  def acted_at_date(html_options = {})
    if model.acted_at
      html_options = html_options.stringify_keys
      html_options.reverse_merge!(
        'class' => 'acted_at_date'
      )
      formatted_date model.acted_at, html_options
    end
  end

  def content
    if model.content?
      h.simple_format model.content
    end
  end

  def figure_file(html_options = {})
    html_options = html_options.stringify_keys
    if model.figure? && model.figure.content?
      html_options['target'] = '_blank'
      html_options['data-skip-pjax'] = true
      link_tag = h.link_to model.figure.caption, model.figure.file.url, html_options
      link_tag
    end
  end

  def figure_image(html_options = {})
    html_options = html_options.stringify_keys
    if model.figure? && model.figure.image?
      if html_options['swipebox']
        if h.request.smart_phone?
          image_url = model.figure.image.middle.url
        else
          image_url = model.figure.image.url
        end
        unless html_options['swipebox_title']
          html_options['swipebox_title'] = figure_caption
        end
        image_tag = h.swipebox(image_url, model.figure.image.small.url, html_options)
      else
        image_tag = h.image_tag model.figure.image.small.url, html_options
      end
      image_tag
    end
  end

private
  def figure_caption
    if model.content
      title = h.truncate(model.content.gsub(/(\r\n|\r|\n)/, ' '), length: 10)
    else
      ''
    end
  end
end
