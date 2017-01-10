require "rails_helper"

describe "event creation" do
  scenario "user can create an event", :vcr do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    create(:restaurant, yelp_id: "la-potranca-taqueria-denver")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit search_path

    fill_in :location, with: "80216"
    fill_in :term, with: "tacos"
    click_on "Search"
    click_on('+', match: :first)

    expect(current_path).to eq(new_event_path)

    find('input#datepicker', visible: false).set("2018-10-10 06:30 PM")

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
    create(:restaurant, yelp_id: "la-potranca-taqueria-denver")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit search_path

    fill_in :location, with: "80216"
    fill_in :term, with: "tacos"
    click_on "Search"
    click_on('+', match: :first)

    expect(current_path).to eq(new_event_path)

    find('input#datepicker', visible: false).set("2018-10-10 06:30 PM")

    click_on "Send Invitation"

    expect(page).to have_content "Your invitation was not sent"
    expect(current_path).to eq(events_path)
  end
  scenario "event can't start in the past", :vcr do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    create(:restaurant, yelp_id: "la-potranca-taqueria-denver")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit search_path

    fill_in :location, with: "80216"
    fill_in :term, with: "tacos"
    click_on "Search"
    click_on('+', match: :first)

    expect(current_path).to eq(new_event_path)

    find('input#datepicker', visible: false).set("2017-01-01 06:30 PM")

    select group.name, from:"event[group_id]"

    click_on "Send Invitation"

    expect(page).to have_content "Your invitation was not sent. Event start can't be in the past."
    expect(current_path).to eq(events_path)
  end
end
