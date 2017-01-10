class Restaurant < ApplicationRecord
  has_many :events
  has_many :reviews
  has_many :rsvps, through: :events

  validates :yelp_id, presence: true
  validates :name, presence: true

  validates_uniqueness_of :name, :scope => :yelp_id

  def yelp_object
    YelpService.business_search(self.yelp_id).business
  end

  def timezone
    yelp_business = self.yelp_object
    Timezone.lookup(yelp_business.location.coordinate.latitude, yelp_business.location.coordinate.longitude)
  end

  def self.find_restaurant_from_yelp_response(restaurant)
    id = restaurant.id
    restaurant = Restaurant.find_by(yelp_id: id)
  end

  def self.has_reviews?(restaurant)
    restaurant_obj = Restaurant.find_restaurant_from_yelp_response(restaurant)
    restaurant_obj && !restaurant_obj.reviews.empty?
  end

  def self.count_past_events_at_restaurant(restaurant)
    restaurant_obj = Restaurant.find_restaurant_from_yelp_response(restaurant)
    if restaurant_obj
      restaurant_obj.events.where("event_start < ?", Time.now).count
    else
      0
    end
  end
end
