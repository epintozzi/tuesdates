require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    it "is invalid without a user" do
      restaurant = create(:restaurant)
      review = Review.create(restaurant_id: restaurant.id, review_content: "this is content", stars: 4)

      expect(review).to be_invalid
    end
    it "is invalid without a restaurant" do
      user = create(:user)
      review = Review.create(user_id: user.id, review_content: "this is content", stars: 4)

      expect(review).to be_invalid
    end
    it "is invalid without a content" do
      user = create(:user)
      restaurant = create(:restaurant)
      review = Review.create(user_id: user.id, restaurant_id: restaurant.id, stars: 4)

      expect(review).to be_invalid
    end
    it "is invalid without a stars" do
      user = create(:user)
      restaurant = create(:restaurant)
      review = Review.create(user_id: user.id, restaurant_id: restaurant.id, review_content: "this is content")

      expect(review).to be_invalid
    end
    it "is valid with all attributes" do
      user = create(:user)
      restaurant = create(:restaurant)
      review = Review.create(user_id: user.id, restaurant_id: restaurant.id, review_content: "this is content", stars: 4)

      expect(review).to be_valid
    end
  end
  describe "relationships" do
    it "belongs to a restaurant" do
      review = create(:review)
      expect(review).to respond_to(:restaurant)
    end
    it "belongs to a user" do
      review = create(:review)
      expect(review).to respond_to(:user)
    end
  end
  describe "uniqueness" do
    it "requires a unique user and restaurant combo" do
      user = create(:user)
      restaurant = create(:restaurant)
      review = Review.create(user_id: user.id, restaurant_id: restaurant.id, review_content: "content", stars: 5)
      expect(review).to be_valid

      review_2 = Review.create(user_id: user.id, restaurant_id: restaurant.id, review_content: "content 2", stars: 4)
      expect(review_2).to be_invalid
    end
  end
end
