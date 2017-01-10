require "rails_helper"

describe "/group/:id" do
  scenario "user can leave a group" do
    user = create(:user)
    group = create(:group)
    group.users = [user]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit groups_path

    click_on group.name
    expect(current_path).to eq(group_path(group))
    expect(page).to have_content(user.first_name)

    click_link "Leave group"

    expect(page).to have_content("You have left the group: #{group.name}")
    expect(current_path).to eq(groups_path)
  end
end
