class SearchController < ApplicationController

  def index
    location = params[:location] ||= request.location.city
    term = {term: params[:term]}
    if params[:term].nil?
      @restaurants = []
    else
      @restaurants = YelpService.search_response(location, term)
    end
  end

end
