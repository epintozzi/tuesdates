class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :review_content, presence: true
  validates :stars, presence: true
  validates_uniqueness_of :user_id, :scope => :restaurant_id
end
