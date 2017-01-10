class SearchController < ApplicationController

  def index
    location = params[:location]
    location = request.location.try(:city) || '80216' if location.nil? || location.empty?
    if params[:term].nil?
      @restaurants = YelpService.search_response(location)
    else
      @restaurants = YelpService.search_response(location, {term: params[:term]})
    end
  end

end
