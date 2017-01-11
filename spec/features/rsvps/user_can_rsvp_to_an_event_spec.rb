require "rails_helper"

describe "/events/:id/rsvp" do
  scenario "user can RSVP to an event", :vcr do
    user = create(:user)
    event = create(:event, user_id: user.id)
    event.group.users = [user]
    event.reload
    event.send(:send_rsvps)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    rsvp = event.rsvps.where(user_id: user.id).first

    visit event_path(event)
    click_link "RSVP"
    expect(page).to have_content("Update your RSVP for #{event.restaurant.name}")
    expect(current_path).to eq(edit_event_rsvp_path(event, rsvp))
    select "attending"
    click_on "Confirm RSVP"

    expect(current_path).to eq(event_path(event))
    expect(page).to have_content("You have updated your RSVP to this event")
  end
end
