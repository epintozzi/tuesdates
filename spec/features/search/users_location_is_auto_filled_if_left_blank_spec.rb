require "rails_helper"

describe "/search" do
  scenario "users location is auto filled by ip if left blank", :vcr do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit search_path

    fill_in :term, with: "tacos"

    click_on "Search"

    expect(page).to have_content("Tacos Tequila Whiskey")
    expect(page).to have_content("1514 York St")
  end
end
