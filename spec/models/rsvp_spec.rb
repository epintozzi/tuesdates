require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  describe "validations" do
    it "is invalid without a user" do
      event = create(:event)
      rsvp = Rsvp.create(event_id: event.id, status: 0)

      expect(rsvp).to be_invalid
    end
    it "is invalid without an event" do
      user = create(:user)
      rsvp = Rsvp.create(user_id: user.id, status: 0)

      expect(rsvp).to be_invalid
    end
    it "is invalid without a status" do
      user = create(:user)
      event = create(:event)
      rsvp = Rsvp.create(user_id: user.id, event_id: event.id, status: nil)

      expect(rsvp).to be_invalid
    end
    it "is valid with all attributes" do
      user = create(:user)
      event = create(:event)
      rsvp = Rsvp.create(user_id: user.id, event_id: event.id, status: 0)

      expect(rsvp).to be_valid
    end
  end

  describe "relationships" do
    it "belongs to a user" do
      rsvp = create(:rsvp)
      expect(rsvp).to respond_to(:user)
    end
    it "belongs to an event" do
      rsvp = create(:rsvp)
      expect(rsvp).to respond_to(:event)
    end
  end
end
