class YelpService

  def search_response(term, location)
    response = client.search(term, location)
    response.businesses
  end

end
