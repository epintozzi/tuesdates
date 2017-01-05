require "rails_helper"

describe "User can search for restaurants" do
  scnenario "user can search for restaurants" do
    visit search_path

    fill_in #search params of my choosing
    fill_in #location

    click_on "Search"

    expect(page).to have_content("Restaurant name")
    expect(page).to have_content("Address line")
    expect(page).to have_content("cuisine type")
    expect(page).to have_content("dollar signs")
    expect(page).to have_content("on Yelp") #star ratings
  end
end
