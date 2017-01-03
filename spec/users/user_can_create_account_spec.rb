require 'rails_helper'

describe "user can create account" do
  xscenario "user can create account with google" do
    visit root_path

    click_on "Sign up with Google"
  end

  xscenario 'user can log in after creating account' do

    expect(page).to have_content("Welcome, #{user.first_name}")
    expect(current_path).to eq(dashboard_path)
  end
end
