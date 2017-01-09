FactoryGirl.define do
  factory :review do
    review_content "this is the best restaurant ever!"
    stars 1
    restaurant
    user
  end
end
