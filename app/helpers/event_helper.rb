module EventHelper

  def show_name_or_email(rsvp)
    if rsvp.user.first_name.nil?
      "#{rsvp.user.email} - #{rsvp.status}"
    else
      "#{rsvp.user.first_name} #{rsvp.user.last_name} - #{rsvp.status}"
    end
  end

  def rsvp_button(rsvp, event)
    if !rsvp.nil? && event.event_start.future?
      link_to edit_event_rsvp_path(event, rsvp) do
        button_tag "RSVP", {type: "button", class:"btn btn-success"}
      end
    end
  end

end

def event_edit_button(event)
  if  event.event_start.future? && event.user == current_user
    link_to edit_event_path(event) do
      button_tag "Edit", {type: "button", class: "btn btn-primary"}
    end
  end

  # def leave_review_button(event)
  #   if event.event_start.past?
  #     link_to new_restaurant_review_path(event.restaurant) do
  #       button_tag "Leave a review", {type: "button", class: "btn btn-primary"}
  #     end
  #   end
  # end


end
