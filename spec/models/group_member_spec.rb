require 'rails_helper'

RSpec.describe GroupMember, type: :model do
  describe "validations" do
    it "is invalid without user id" do
      group = create(:group)
      group_member = GroupMember.new(group_id: group.id)
      expect(group_member).to be_invalid
    end
    it "is invalid without group id" do
      user = create(:user)
      group_member = GroupMember.new(user_id: user.id)
      expect(group_member).to be_invalid
    end
    it "is valid with all attributes" do
      user = create(:user)
      group = create(:group)
      group_member = GroupMember.new(user_id: user.id, group_id: group.id)
      expect(group_member).to be_valid
    end
  end

  describe "relationships" do
    it "belongs to a user" do
      group_member = create(:group_member)
      expect(group_member).to respond_to(:user)
    end
    it "belongs to a group" do
      group_member = create(:group_member)
      expect(group_member).to respond_to(:group)
    end
  end
end
