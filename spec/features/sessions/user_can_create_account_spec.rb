require 'rails_helper'

describe "user can create account" do
  scenario "user can create account with google" do
    visit root_path

    click_on "Sign up with Google"
  end
end
