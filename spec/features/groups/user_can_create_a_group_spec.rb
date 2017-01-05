require "rails_helper"

describe "user creates a group" do
  scenario "user can create a new group" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit groups_path

    click_link "Create new group"
    expect(current_path).to eq(new_group_path)

    fill_in "group[name]", with: "my group name"

    click_on "Create Group"

    expect(page).to have_content("my group name")
    expect(page).to have_content("Your group was successfully created")
    expect(page).to have_content("Group Members")
    expect(page).to have_content(user.last_name)
    expect(page).to have_content("Invite others to this group")
  end

  scenario "user sees an error if a group doesn't successfully create" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit groups_path

    click_link "Create new group"
    expect(current_path).to eq(new_group_path)

    fill_in "group[name]", with: ""

    click_on "Create Group"

    expect(page).to_not have_content("my group name")
    expect(page).to have_content("There was a problem creating your group. Please try again.")
  end
end
