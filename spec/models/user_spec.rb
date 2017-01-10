require 'rails_helper'

describe User, type: :model do
  describe "user creation with oauth" do
    scenario "user creates itself from an oauth hash" do
      auth = {
        'provider' => 'google',
        'uid' => '1234567890',
        'info'=> {
          'email'=> "erin@email.com",
          'first_name'=> "Erin",
          'last_name'=> "Pintozzi",
          'image'=> "image.png"
        }
      }
      User.from_omniauth(auth)
      user = User.last

      expect(user.provider).to eq("google")
      expect(user.uid).to eq("1234567890")
      expect(user.email).to eq("erin@email.com")
    end
  end
  describe "validations" do
    it "is invalid without an email" do
      user = User.create(uid: '123', provider: 'google')

      expect(user).to be_invalid
    end
    it "valid with an email" do
      user = User.create(email: '789@email.com')

      expect(user).to be_valid
    end
    it "saves with all attributes" do
      user = User.create(email: "952@email.com", provider: "google", uid: "45678", first_name: "erin", last_name: "pintozzi", image_url: "image.png")
      expect(user).to be_valid
    end
  end
  describe "uniqueness" do
    it "requires a unique email to create a user" do
      user = User.create(email: '456@email.com')
      expect(user).to be_valid

      user = User.new(email: '456@email.com')
      expect(user).to be_invalid
    end
  end
  describe "relationships" do
    it "has many group_members" do
      user = create(:user)
      expect(user).to respond_to(:group_members)
    end
    it "has many groups" do
      user = create(:user)
      expect(user).to respond_to(:groups)
    end
    it "has many events" do
      user = create(:user)
      expect(user).to respond_to(:events)
    end
    it "has many rsvps" do
      user = create(:user)
      expect(user).to respond_to(:rsvps)
    end
    it "has many invited_events" do
      user = create(:user)
      expect(user).to respond_to(:invited_events)
    end
  end
end
