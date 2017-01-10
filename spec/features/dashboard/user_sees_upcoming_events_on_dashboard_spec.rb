require "rails_helper"

describe "/dashboard" do
  scenario "user sees upcoming events on dashboard" do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    event = create(:event, group_id: group.id, event_start: "2028-01-07 15:24:48")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Upcoming Events")
    expect(page).to have_content(group.name)
    expect(page).to have_content("Jan 7, 2028")
    expect(page).to have_content(event.user.first_name)
    expect(page).to have_link("Details", :href=>"/events/#{event.id}")
  end
  scenario "user sees 'no upcoming events' message on dashboard if they have no events scheduled" do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    event = create(:event)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("You have no upcoming events")
    expect(page).to_not have_content(group.name)
  end
end
