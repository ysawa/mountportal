module FormsHelper
  def time_options_for_select
    options = [['-', '']]
    options += (24 * 12).times.collect do |i|
      hour = i * 5 / 60
      min = i * 5 % 60
      hour_min = '%02d:%02d' % [hour, min]
      [hour_min, hour * 3600 + min * 60]
    end
    options
  end
end
