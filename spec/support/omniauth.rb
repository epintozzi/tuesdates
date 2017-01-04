def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    provider: 'google',
    uid: '1234567890',
    info: {
      email: "erin@email.com",
      first_name: "Erin",
      last_name: "Pintozzi",
      image: "image.png"
    }
  })
end
