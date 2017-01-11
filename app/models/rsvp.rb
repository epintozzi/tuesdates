class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :status, presence: true

  enum status: [:pending, :attending, :declined]

  after_create :send_email

  def send_email
    EventNotifierMailer.inform(user, user.email).deliver_now
  end
end
