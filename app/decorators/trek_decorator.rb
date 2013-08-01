class TrekDecorator < ApplicationDecorator
  delegate_all

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
