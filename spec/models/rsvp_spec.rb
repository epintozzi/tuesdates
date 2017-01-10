require 'rails_helper'

RSpec.describe Rsvp, type: :model do
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
