require 'rails_helper'

describe User, type: :model do
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
    user = User.first

    expect(user.provider).to eq("google")
    expect(user.uid).to eq("1234567890")
    expect(user.email).to eq("erin@email.com")
  end
end
