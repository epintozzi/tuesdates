require "rails_helper"

describe "user edits a group" do
  scenario "a user can edit a group they are a part of" do
    user = create(:user)
    group = create(:group, name: "old name")
    group.users = [user]
    group.save

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)

    expect(page).to have_content("old name")

    click_on "Edit group"
    fill_in "group[name]", with: "new group name"
    click_on "Update Group"

    expect(current_path).to eq(group_path(group))
    expect(page).to have_content("new group name")
    expect(page).to have_content("Your group has been updated")
    expect(page).to_not have_content("old name")
  end

  scenario "user sees error message if group didn't update" do
    user = create(:user)
    group = create(:group, name: "old name")
    group.users = [user]
    group.save

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)

    expect(page).to have_content("old name")

    click_on "Edit group"
    fill_in "group[name]", with: ""
    click_on "Update Group"

    expect(page).to have_content("Your changes were not saved")
  end

  xscenario "a user cannot edit a group they do not belong to" do
    user = create(:user)
    group_1, group_2 = create_list(:group, 2)
    group_1.users = [user]
    group_1.save

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group_2)

    expect(page).to_not have_link("Edit", :href=>"/groups/#{group_2.id}/edit")
  end

end
