class Event < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  belongs_to :group
end
