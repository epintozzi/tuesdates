class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :status, presence: true

  enum status: [:pending, :attending, :declined]
end
