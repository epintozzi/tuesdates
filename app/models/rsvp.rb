class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: [:pending, :attending, :declined]
end
