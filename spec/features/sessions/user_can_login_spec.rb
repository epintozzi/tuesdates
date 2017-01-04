require 'rails_helper'

describe "user can log in" do
  scenario "user can log in with google oauth" do
    stub_omniauth

    visit root_path

    click_on "Sign in with Google"

    expect(page).to have_content("Welcome, Erin")
    expect(page).to have_content("You have successfully logged in.")
    expect(page).to have_link("Logout")
    expect(current_path).to eq(dashboard_path)
  end
end
