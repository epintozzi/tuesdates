require "rails_helper"

describe "/reviews/new" do
  scenario "user can leave a review on restaurant of a past event", :vcr do
    user = create(:user)
    user_2 = create(:user)
    restaurant = create(:restaurant)
    group = create(:group)
    group.users = [user]
    event = Event.new(group_id: group.id, event_start: "2017-01-07 15:24:48", user_id: user_2.id, restaurant_id: restaurant.id)
    event.save(validate: false)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit event_path(event)

    click_link "Leave a review"
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
