require "rails_helper"

describe "/events" do
  scenario "user sees all their own events" do
    user = create(:user)
    group_1, group_2 = create_list(:group, 2)
    group_1.users = [user]
    group_2.users = [user]
    event_1 = create(:event, user_id: user.id, group_id: group_1.id)
    event_2 = create(:event, user_id: user.id, group_id: group_2.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit events_path

    expect(page).to have_content(event_1.user.first_name)
    expect(page).to have_content(event_1.group.name)
    expect(page).to have_content(event_1.event_start)
    expect(page).to have_content(event_2.user.first_name)
    expect(page).to have_content(event_2.group.name)
    expect(page).to have_content(event_2.event_start)
  end
end
