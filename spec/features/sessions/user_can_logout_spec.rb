require "rails_helper"

describe "user can log out" do
  scenario "user logs out of app" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on "Logout"

    expect(page).to have_content("You have successfully logged out")
  end
end
