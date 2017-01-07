FactoryGirl.define do
  factory :restaurant do
    sequence :yelp_id do |n|
      "Yelp#{}"
    end
    sequence :name do |n|
      "Restaurant #{}"
    end
  end
end
