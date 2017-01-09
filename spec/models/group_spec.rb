require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      group = Group.new()

      expect(group).to be_invalid
    end

    it "is valid with all attributes" do
      group = Group.new(name: "group name")

      expect(group).to be_valid
    end
  end

  describe "relationships" do
    it "has many group_members" do
      group = create(:group)
      expect(group).to respond_to(:group_members)
    end
    it "has many users" do
      group = create(:group)
      expect(group).to respond_to(:users)
    end
    it "has many events" do
      group = create(:group)
      expect(group).to respond_to(:events)
    end
  end
end
