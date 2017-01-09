class Restaurant < ApplicationRecord
  has_many :events
  has_many :reviews

  validates :yelp_id, presence: true
  validates :name, presence: true

  validates_uniqueness_of :name, :scope => :yelp_id
end
