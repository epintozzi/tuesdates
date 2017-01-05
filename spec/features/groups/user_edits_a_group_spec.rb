require "rails_helper"

describe "user edits a group" do
  scenario "a user can edit a group they are a part of" do
    user = create(:user)
    group = create(:group, name: "old name")
    group.users = [user]
    group.save

    visit group_path(group)

    expect(page).to have_content("old name")

    click_on "Edit group"
    fill_in "group[name]", with: "new group name"
    click_on "Update group"

    expect(current_path).to eq(group_path(group))
    expect(page).to have_content("new group name")
    expect(page).to have_content("Your group has been updated")
    expect(page).t_not have_content("old name")
  end
  xscenario "a user cannot edit a group they do not belong to" do
    user = create(:user)
    group_1, group_2 = create_list(:group, 2)
    group_1.users = [user]
    group_1.save

  end
end
