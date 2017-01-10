module ApplicationHelper

  def format_datetime(event_start)
    (event_start).strftime('%-m/%-d/%y at%l:%M %P')
  end
  def format_long_date(event_start)
    (event_start).strftime('%b %e, %Y')
  end


end
