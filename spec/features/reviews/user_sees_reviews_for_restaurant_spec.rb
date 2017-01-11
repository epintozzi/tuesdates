require "rails_helper"

describe "event/:id" do
  before :each do
    @user = create(:user)
    @restaurant = create(:restaurant)
    @event = create(:event, user_id: @user.id, restaurant_id: @restaurant.id)
    @event.group.users = [@user]
  end
  scenario "user sees reviews for restaurant assigned to their event" do
    review = create(:review, restaurant_id: @restaurant.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit event_path(@event)

    expect(page).to have_content(review.review_content)
  end
  scenario "user sees 'no reviews' message if a restaurant has no reviews yet" do
    review = create(:review)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit event_path(@event)

    expect(page).to_not have_content(review.review_content)
    expect(page).to have_content("There are no reviews for this restaurant.")
  end
end

describe "restaurant/:id/reviews" do
  before :each do
    @user = create(:user)
    @restaurant = create(:restaurant)
    @event = create(:event, user_id: @user.id, restaurant_id: @restaurant.id)
  end
  scenario "user sees reviews that have been left for restaurant" do
    review = create(:review, restaurant_id: @restaurant.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit restaurant_reviews_path(@restaurant)

    expect(page).to have_content(review.review_content)
  end
  scenario "user sees 'no reviews' message if a restaurant has no reviews yet" do
    review = create(:review)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit restaurant_reviews_path(@restaurant)

    expect(page).to_not have_content(review.review_content)
    expect(page).to have_content("There are no reviews for this restaurant.")
  end
end
