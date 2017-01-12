class User < ApplicationRecord
  has_many :group_members
  has_many :groups, through: :group_members
  has_many :events
  has_many :rsvps
  has_many :invited_events, through: :rsvps, class_name: "Event", source: :event

  validates :email, presence: true
  validates_uniqueness_of :email

  def self.from_omniauth(auth_hash)
    user = where("lower(email) = ?", auth_hash['info']['email'].downcase).first_or_create(email: auth_hash['info']['email'])
    user.provider = auth_hash['provider']
    user.uid = auth_hash['uid']
    user.first_name = auth_hash['info']['first_name']
    user.last_name = auth_hash['info']['last_name']
    user.image_url = auth_hash['info']['image']
    user.save!
    user
  end
end
