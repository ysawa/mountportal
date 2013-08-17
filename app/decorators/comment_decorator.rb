class CommentDecorator < ApplicationDecorator
  delegate_all

  def acted_at
    if model.acted_at
      formatted_time model.acted_at, class: 'acted_at'
    end
  end
end
