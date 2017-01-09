require "rails_helper"

describe "/dashboard" do
  xscenario "user sees past events on dashboard" do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    event = create(:event, group_id: group.id, event_start: "2017-01-07 15:24:48")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Past Events")
    expect(page).to have_content(group.name)
    expect(page).to have_content(event.event_start)
    expect(page).to have_content(event.user)
    expect(page).to have_link("Details", :href=>"/events/#{event.id}")
  end
  xscenario "user sees 'no past events' message on dashboard if they have no past events" do
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
