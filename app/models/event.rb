class Event < ApplicationRecord
  validates :event_start, presence: true, date: true

  belongs_to :restaurant
  belongs_to :user
  belongs_to :group
  has_many :group_members, through: :group
  has_many :rsvps
  has_many :users, through: :rsvps

  after_create :send_rsvps

  private

  def send_rsvps
    group_members.each do |member|
      Rsvp.create(user: member.user, event: self) if !member.user.nil?
    end
  end
end
