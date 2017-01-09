require "rails_helper"

describe "/search" do
  xscenario "users location is auto filled by ip if left blank", :vcr do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    allow_any_instance_of(ActionDispatch::Request).to receive(:remote_ip).and_return('73.153.110.200')

    visit search_path

    fill_in :term, with: "tacos"

    click_on "Search"

    expect(page).to have_content("La Potranca Taqueria")
    expect(page).to have_content("2336 E 46th Ave")
  end
end
