class EventsController < ApplicationController

  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @restaurant = Restaurant.first_or_create(name: params[:restaurant_name], yelp_id: params[:yelp_id])
    @event.restaurant = @restaurant
    @address = params[:address]
  end

  def create
    @event = Event.create(event_params)
    @event.restaurant = Restaurant.first_or_create(restaurant_params)
    @event.user = current_user

    response = Yelp.client.business(@event.restaurant.yelp_id)
    @address = response.business.location.display_address

    if @event.save
      flash[:success] = "Your invitation has been sent!"
      redirect_to event_path(@event)
    else
      flash[:failure] = "Your invitation was not sent"
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

  def restaurant_params
    params.require(:restaurant).permit(:name, :yelp_id)
  end

end
