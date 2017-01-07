class EventsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.create(event_params)
    @event.user = current_user
    if @event.save
      flash[:success] = "Your invitation has been sent!"
      redirect_to event_path(@event)
    else
      flash[:failure] = "Your iniviation was not sent"
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def event_params
    params.require(:event).permit(:id, :group_id, :user_id, :restaurant_id, :event_start)
  end

end
