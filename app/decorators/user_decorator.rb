class UserDecorator < ApplicationDecorator
  delegate_all

  def name(link = nil)
    if model.name?
      result = model.name
    else
      result = User.human_attribute_name('name')
    end
    if link
      link_to result, result
    else
      result
    end
  end
end
