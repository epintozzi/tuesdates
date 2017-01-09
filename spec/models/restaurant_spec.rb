require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      restaurant = Restaurant.new(yelp_id: "yelp id")

      expect(restaurant).to be_invalid
    end
    it "is invalid without a yelp_id" do
      restaurant = Restaurant.new(name: "restaurant name")

      expect(restaurant).to be_invalid
    end
    it "is valid with all required attributes" do
      restaurant = Restaurant.new(name: "restaurant name", yelp_id: "yelp id")

      expect(restaurant).to be_valid
    end
    it "is valid with all attributes" do
      restaurant = Restaurant.new(name: "restaurant name", yelp_id: "yelp id", street: "123 main", city: "denver", state: "co", zip: "12345")

      expect(restaurant).to be_valid
    end
  end
  describe "uniqueness" do
    xit "has a unique yelp_id and name combination" do
      restaurant_1 = Restaurant.create(name: "restaurant_1", yelp_id: "yelp 1")
      expect(restaurant_1).to be_valid

      restaurant_2 = Restaurant.new(name: "restaurant_1", yelp_id: "yelp 1")
      expect(restaurant_2).to be_invalid

      restaurant_3 = Restaurant.new(name: "restaurant 1", yelp_id: "yelp 3")
      expect(restaurant_3).to be_valid
    end
  end
  describe "relationships" do
    it "has many events" do
      restaurant = create(:restaurant)
      expect(restaurant).to respond_to(:events)
    end
  end
end
