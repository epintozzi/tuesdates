require "rails_helper"

describe "/dashboard" do
  scenario "user sees past events on dashboard", :vcr do
    user = create(:user)
    user_2 = create(:user)
    restaurant = create(:restaurant)
    group = create(:group)
    group.users = [user]
    event = Event.new(group_id: group.id, event_start: "2017-01-07 15:24:48", user_id: user_2.id, restaurant_id: restaurant.id)
    event.save(validate: false)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Past Events")
    expect(page).to have_content(group.name)
    expect(page).to have_content("Jan 7, 2017")
    expect(page).to have_content(event.user.first_name)
    expect(page).to have_link("Details", :href=>"/events/#{event.id}")
  end
  scenario "user sees 'no past events' message on dashboard if they have no past events" do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    event = create(:event, event_start: "2028-01-07 15:24:48")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("You have no past events")
    expect(page).to_not have_content(group.name)
  end
end
