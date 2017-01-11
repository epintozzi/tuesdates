class EventsController < ApplicationController

  def index
    if !current_user
      flash[:warning] = "You must log in to see your events"
      redirect_to root_path
    else
      @events = current_user.invited_events
    end
  end

  def show
    @event = Event.find(params[:id])
    @rsvp = Rsvp.find_by(user: current_user, event: @event)
  end

  def new
    @event = Event.new
    @restaurant = Restaurant.find_or_create_by(name: params[:restaurant_name], yelp_id: params[:yelp_id], street: params[:street], city: params[:city], state: params[:state], zip: params[:zip])
    @event.restaurant = @restaurant
  end

  def create
    @event = Event.new(event_params)
    @event.restaurant = Restaurant.find_or_create_by(restaurant_params)
    @event.user = current_user
    @restaurant = @event.restaurant
    # Ensure we save the time local to the Restaurant's timezone
    @event.event_start = @restaurant.timezone.local_to_utc(@event.event_start)
    if @event.save
      flash[:success] = "Your invitation has been sent!"
      redirect_to event_path(@event)
    else
      flash[:failure] = "Your invitation was not sent. #{@event.errors.full_messages.join(' ')}"
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @restaurant = @event.restaurant
  end

  def update
    @event = Event.find(params[:id])
    @restaurant = @event.restaurant
    if @event.update(event_params)
      flash[:success] = "Your event has been updated and new RSVPs will be sent to the group."
      redirect_to event_path(@event)
    else
      flash[:failure] = "Your event did not update. Please try again."
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:id, :group_id, :user_id, :restaurant_id, :event_start)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :yelp_id, :street, :city, :state, :zip)
  end

end
