require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    before :each do
      @group = create(:group)
      @restaurant = create(:restaurant)
      @user = create(:user)
    end

    it "is invalid without a user" do
      event = Event.new(group_id: @group.id, restaurant_id: @restaurant.id, event_start: "2027-01-07 15:24:48")

      expect(event).to be_invalid
    end
    it "is invalid without a group" do
      event = Event.new(user_id: @user.id, restaurant_id: @restaurant.id, event_start: "2027-01-07 15:24:48")

      expect(event).to be_invalid
    end
    it "is invalid without a restaurant" do
      event = Event.new(group_id: @group.id, user_id: @user.id, event_start: "2027-01-07 15:24:48")

      expect(event).to be_invalid
    end
    it "is invalid without an event_start" do
      event = Event.new(group_id: @group.id, user_id: @user.id, restaurant_id: @restaurant.id)

      expect(event).to be_invalid
    end
    it "is invalid with a past event_start date" do
      event = Event.new(group_id: @group.id, user_id: @user.id, restaurant_id: @restaurant.id, event_start: "2017-01-07 15:24:48")

      expect(event).to be_invalid
    end

    it "is valid with all attributes" do
      event = Event.new(user_id: @user.id, group_id: @group.id, restaurant_id: @restaurant.id, event_start: "2027-01-07 15:24:48")

      expect(event).to be_valid
    end
  end
  describe "relationships" do
    it "belongs to restaurants" do
      event = create(:event)
      expect(event).to respond_to(:restaurant)
    end
    it "belongs to users" do
      event = create(:event)
      expect(event).to respond_to(:user)
    end
    it "belongs to group" do
      event = create(:event)
      expect(event).to respond_to(:group)
    end
    it "has many rsvps" do
      event = create(:event)
      expect(event).to respond_to(:rsvps)
    end
    it "has many users" do
      event = create(:event)
      expect(event).to respond_to(:users)
    end
    it "has many group_memberss" do
      event = create(:event)
      expect(event).to respond_to(:group_members)
    end
  end
end
