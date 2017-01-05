require "rails_helper"

describe "User can search for restaurants" do
  scenario "user can search for restaurants", :vcr do
    visit search_path

    fill_in :location, with: "80216"
    fill_in :term, with: "tacos"

    click_on "Search"

    expect(page).to have_content("Restaurant name")
    expect(page).to have_content("Address line")
    expect(page).to have_content("cuisine type")
    expect(page).to have_content("dollar signs")
    expect(page).to have_content("on Yelp") #star ratings
  end
end
