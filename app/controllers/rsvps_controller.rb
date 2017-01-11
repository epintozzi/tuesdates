class RsvpsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update]

  def edit
    @event = Event.find(params[:event_id])
    @rsvp = Rsvp.find(params[:id])
  end

  def update
    @rsvp = Rsvp.find(params[:id])
    @event = Event.find(params[:event_id])
    if @rsvp.update(rsvp_params)
      flash[:success] = "You have updated your RSVP to this event"
      redirect_to event_path(@event)
    else
      flash[:failure] = "Your RSVP did not save. Please try again."
      render :update
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:id, :event_id, :user_id, :status)
  end

end
