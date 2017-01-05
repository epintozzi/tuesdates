require "rails_helper"

describe "User can search for restaurants" do
  scenario "user can search for restaurants", :vcr do
    visit search_path

    fill_in :search, with: "tacos"
    fill_in :zip, with: "80216"

    click_on "Search"

    expect(page).to have_content("Restaurant name")
    expect(page).to have_content("Address line")
    expect(page).to have_content("cuisine type")
    expect(page).to have_content("dollar signs")
    expect(page).to have_content("on Yelp") #star ratings
  end
end
