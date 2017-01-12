class SearchController < ApplicationController
  authorize_resource class: false
  
  def index
    location = params[:location]
    location = request.location.try(:city) || '80216' if location.nil? || location.empty?
    if params[:term].nil?
      @restaurants = Rails.cache.fetch(location, expires_in: 6.hours) do
        YelpService.search_response(location)
      end
    else
      @restaurants = YelpService.search_response(location, {term: params[:term]})
    end
  end

end
