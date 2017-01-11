require "rails_helper"

describe "events/:id" do
  scenario "user sees individual event details", :vcr do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    restaurant = create(:restaurant)
    event = create(:event, user_id: user.id, group_id: group.id, restaurant_id: restaurant.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit event_path(event)

    expect(page).to have_content(group.name)
    expect(page).to have_content(restaurant.name)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(restaurant.street)
    expect(page).to have_content(event.group.users.first.first_name)
  end
end
