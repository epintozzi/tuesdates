require "rails_helper"

describe "/reviews/new" do
  scenario "user can leave a review on restaurant of a past event" do
    user = create(:user)
    restaurant = create(:restaurant)
    event = create(:event, event_start: "2017-01-02 15:24:48", user_id: user.id, restaurant_id: restaurant.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit event_path(event)

    click_on "Leave a review"
    expect(current_path).to eq(new_restaurant_review_path(restaurant))
    fill_in "review[review_content]", with: "this was a great restaurant"
    fill_in "review[stars]", with: 4
    click_on "Submit Review"

    expect(current_path).to eq(restaurant_reviews_path(restaurant))
    expect(page).to have_content("Thank you for submitting your review")
    expect(page).to have_content(restaurant.name)
    expect(page).to have_content("this was a great restaurant")
  end
end
