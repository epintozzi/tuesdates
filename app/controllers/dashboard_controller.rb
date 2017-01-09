class DashboardController < ApplicationController

  def index
    @events = current_user.groups.each do |group|
      group.events
    end
  end

end
