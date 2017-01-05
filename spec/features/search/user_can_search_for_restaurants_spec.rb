require "rails_helper"

describe "User can search for restaurants" do
  scenario "user can search for restaurants", :vcr do
    visit search_path

    fill_in :location, with: "80216"
    fill_in :term, with: "tacos"

    click_on "Search"

    expect(page).to have_content("La Potranca Taqueria")
    expect(page).to have_content("2336 E 46th Ave")
  end
end
