require "rails_helper"

describe "event creation" do
  scenario "user can create an event", :vcr do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    restaurant = create(:restaurant)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit search_path

    fill_in :location, with: "80216"
    fill_in :term, with: "tacos"
    click_on "Search"
    click_on "La Potranca Taqueria"

    expect(current_path).to eq(new_event_path)

    # fill_in "event[date]", with: "01/07/2016"
    # fill_in "event[time]", with: "1:00"
    # click_on "PM"
    select group.name, from:"event[group_id]"

    click_on "Send Invitation"

    event = Event.first

    expect(page).to have_content "Your invitation has been sent!"
    expect(current_path).to eq(event_path(event))
  end
end
