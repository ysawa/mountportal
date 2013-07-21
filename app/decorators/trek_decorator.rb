class TrekDecorator < ApplicationDecorator
  delegate_all

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
