class Event < ApplicationRecord
  validates :event_start, presence: true

  belongs_to :restaurant
  belongs_to :user
  belongs_to :group
end
