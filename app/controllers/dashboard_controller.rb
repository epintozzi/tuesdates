class DashboardController < ApplicationController
  authorize_resource class: false

  def index
    @future_events = current_user.invited_events.where("event_start >= ?", Time.now)
    @past_events = current_user.invited_events.where("event_start < ?", Time.now)
  end

end
