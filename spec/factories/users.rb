FactoryGirl.define do
  factory :user do
    provider "google"
    sequence :uid do |n|
      "123#{n}"
    end
    first_name "First_name"
    last_name "Last_name"
    image_url "image.png"
    sequence :email do |n|
      "user#{n}@example.com"
    end
  end
end
