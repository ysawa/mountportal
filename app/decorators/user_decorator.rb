class UserDecorator < ApplicationDecorator
  delegate_all

  def content(html_options = {})
    if model.content?
      h.simple_format model.content, html_options
    end
  end

  def face(html_options = {})
    html_options = html_options.stringify_keys.reverse_merge(
      'class' => 'face'
    )
    user_signed_in = html_options.delete 'user_signed_in'
    if user_signed_in && model.face? && model.face.image?
      image_tag = h.image_tag model.face.image.thumb.url, html_options
    elsif model.male?
      image_tag = h.image_tag 'users/male.png', html_options
    else
      image_tag = h.image_tag 'users/female.png', html_options
    end
    image_tag
  end

  def name(link = nil)
    if model.name?
      result = model.name
    else
      result = User.human_attribute_name('name')
    end
    if link
      h.link_to result, result
    else
      result
    end
  end
end
