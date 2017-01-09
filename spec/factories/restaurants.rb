FactoryGirl.define do
  factory :restaurant do
    sequence :yelp_id do |n|
      "Yelp#{}"
    end
    sequence :name do |n|
      "Restaurant #{}"
    end
    street "123 main"
    city "Denver"
    state "CO"
    zip "80216"
  end
end
