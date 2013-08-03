class UserDecorator < ApplicationDecorator
  delegate_all

  def face
    if model.male?
      image_tag = h.image_tag 'users/male.png'
    else
      image_tag = h.image_tag 'users/female.png'
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
