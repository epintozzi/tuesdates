module ApplicationHelper

  def convert_to_local(event)
    event.restaurant.timezone.utc_to_local(event.event_start)
  end

  def format_datetime(event)
    event_start = convert_to_local(event)
    (event_start).strftime('%-m/%-d/%y at%l:%M %P')
  end
  def format_long_date(event)
    event_start = convert_to_local(event)
    (event_start).strftime('%b %e, %Y')
  end

end
