require "rails_helper"

describe "/group/:id/group_members/new" do
  scenario "user can invite someone to a group" do
    user = create(:user)
    invitee = create(:user)
    group = create(:group)
    group.users = [user]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)

    fill_in "user[email]", with: invitee.email
    click_on "Invite"

    expect(page).to have_content("#{invitee.email} has been invited to join #{group.name}")
    expect(current_path).to eq(group_path(group))
  end
  scenario "user cannot be added to the same group twice" do
    user = create(:user)
    invitee = create(:user)
    group = create(:group)
    group.users = [user]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)

    fill_in "user[email]", with: invitee.email
    click_on "Invite"
    expect(page).to have_content("#{invitee.email} has been invited to join #{group.name}")

    visit group_path(group)

    fill_in "user[email]", with: invitee.email
    click_on "Invite"

    expect(page).to have_content("#{invitee.email} already belongs to #{group.name}")
  end
end
