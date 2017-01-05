class YelpService

  def self.search_response(location, term)
    response = Yelp.client.search(location, term)
    response.businesses
  end

end
