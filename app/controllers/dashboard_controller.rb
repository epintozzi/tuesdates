class DashboardController < ApplicationController
  authorize_resource class: false

  def index
    @future_events = current_user.invited_events.where("event_start >= ?", Time.now).limit(3).order(event_start: :asc)
    @past_events = current_user.invited_events.where("event_start < ?", Time.now).limit(3).order(event_start: :desc)
  end

end
