class Restaurant < ApplicationRecord
  has_many :events
  has_many :reviews

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
end
