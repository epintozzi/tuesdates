class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_members
  has_many :users, through: :group_members
  has_many :events
end
