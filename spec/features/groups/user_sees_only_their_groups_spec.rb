require "rails_helper"

describe "user sees only their groups" do
  scenario "user sees only their groups on the groups index" do
    user_1 = create(:user)
    user_2 = create(:user)

    group_1 = create(:group)
    group_1.users = [user_1]
    group_1.save

    group_2 = create(:group)
    group_2.users = [user_2]
    group_2.save

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit groups_path

    expect(page).to have_content(group_1.name)
    expect(page).to_not have_content(group_2.name)
  end

  scenario "logged out/unregistered user can't see groups" do
    visit groups_path

    expect(page).to have_content("You must log in to see your groups")
    expect(page).to_not have_content("My Groups")
    expect(current_path).to eq(root_path)
  end
end
