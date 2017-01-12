class DashboardController < ApplicationController
  authorize_resource class: false

  def index
    starting_query = current_user.invited_events.includes(:user, :restaurant, :group)
    @future_events = starting_query.where("event_start >= ?", Time.now).references(:user, :resaurant, :group).limit(3).order(event_start: :asc)
    @past_events = starting_query.where("event_start < ?", Time.now).references(:user, :resaurant, :group).limit(3).order(event_start: :asc)
  end

end
