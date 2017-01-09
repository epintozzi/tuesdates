FactoryGirl.define do
  factory :group do
    sequence :name do |n|
      "Group #{n}"
    end
    factory :group_with_users do
      users { create_list(:user, 3)}
    end
  end
end
