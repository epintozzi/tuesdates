require "rails_helper"

describe "/event/:id/edit" do
  scenario "organizing user can edit an existing event", :vcr do
    user = create(:user)
    event = create(:event, user_id: user.id)
    event.group.users = [user]

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit event_path(event)
    click_link "Edit"
    find('input#datepicker', visible: false).set("2018-11-11 06:00 PM")
    click_on "Send Invitation"

    expect(page).to have_content "Your event has been updated and new RSVPs will be sent to the group."
    expect(current_path).to eq(event_path(event))
  end
  scenario "invited user cannot edit an existing event", :vcr do
    user_1, user_2 = create_list(:user, 2)
    group = create(:group)
    group.users = [user_1, user_2]
    event = create(:event, group_id: group.id, user_id: user_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

    visit event_path(event)

    expect(page).to_not have_link("Edit", :href=>"/event/#{event.id}/edit")
  end
  scenario "user sees error if event does not update", :vcr do
    user = create(:user)
    event = create(:event, user_id: user.id)
    event.group.users = [user]

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit event_path(event)
    click_link "Edit"
    find('input#datepicker', visible: false).set("2016-11-11 06:00 PM")
    click_on "Send Invitation"

    expect(page).to have_content "Your event did not update. Please try again."
    expect(current_path).to eq(event_path(event))
  end
end
