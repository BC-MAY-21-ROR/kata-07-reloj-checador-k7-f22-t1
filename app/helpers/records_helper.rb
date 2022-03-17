module RecordsHelper
  def deff_hours(start_date, end_date)
    '%.2f' % ((end_date.to_time-start_date.to_time)/1.hour)
  end
end
