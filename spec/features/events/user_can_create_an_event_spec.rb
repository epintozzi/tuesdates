require "rails_helper"

describe "event creation" do
  scenario "user can create an event", :vcr do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    restaurant = create(:restaurant, yelp_id: "la-potranca-taqueria-denver")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit search_path

    fill_in :location, with: "80216"
    fill_in :term, with: "tacos"
    click_on "Search"
    click_on('+', match: :first)

    expect(current_path).to eq(new_event_path)

    select "2017", from:"event[event_start(1i)]"
    select "January", from:"event[event_start(2i)]"
    select "12", from:"event[event_start(3i)]"
    select "6 PM", from:"event[event_start(4i)]"
    select "30", from:"event[event_start(5i)]"

    select group.name, from:"event[group_id]"

    click_on "Send Invitation"

    event = Event.first

    expect(page).to have_content "Your invitation has been sent!"
    expect(current_path).to eq(event_path(event))
  end
  scenario "user sees error message if an event is not created", :vcr do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    restaurant = create(:restaurant, yelp_id: "la-potranca-taqueria-denver")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit search_path

    fill_in :location, with: "80216"
    fill_in :term, with: "tacos"
    click_on "Search"
    click_on('+', match: :first)

    expect(current_path).to eq(new_event_path)

    select "2017", from:"event[event_start(1i)]"
    select "January", from:"event[event_start(2i)]"
    select "12", from:"event[event_start(3i)]"
    select "6 PM", from:"event[event_start(4i)]"
    select "30", from:"event[event_start(5i)]"

    click_on "Send Invitation"

    expect(page).to have_content "Your invitation was not sent"
    expect(current_path).to eq(events_path)
  end
end
