require "rails_helper"

describe "visitor sees description and login button" do
  scenario "non-logged in visitor sees description and login button on home page" do
    visit root_path

    expect(page).to have_content("Plan dinners with your friends with less hassle")
    expect(page).to have_content("Send Reminders and RSVPs")
    expect(page).to have_content("Track all your favorite places so you can go again")
    expect(page).to have_link("Log in with Google", :href=>"/auth/google")
  end
end
describe "user sees description and login button" do
  scenario "logged in user sees description and dashboard button on home page" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("Plan dinners with your friends with less hassle")
    expect(page).to have_content("Send Reminders and RSVPs")
    expect(page).to have_content("Track all your favorite places so you can go again")
    expect(page).to have_link("Go to my dashboard", :href=>"/dashboard")
  end
end
