class SearchController < ApplicationController

  def index
    cuisine = params[:search]
    location = params[:zip]
    @restaurants = YelpService.search_response(term, location)
  end

end
