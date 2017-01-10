class YelpService

  def self.search_response(location, term)
    response = Yelp.client.search(location, term)
    response.businesses
  end

  def self.business_search(id)
    Yelp.client.business(id)
  end
end
