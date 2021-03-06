require "rails_helper"

describe "/search" do
  scenario "user can search for restaurants", :vcr do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit search_path

    fill_in :location, with: "80216"
    fill_in :term, with: "tacos"

    click_on "Search"

    expect(page).to have_content("La Potranca Taqueria")
    expect(page).to have_content("2336 E 46th Ave")
  end
end
