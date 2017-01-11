module SearchHelper

  def number_of_tuesdaters_eaten_here(restaurant)
    count = Restaurant.count_past_events_at_restaurant(restaurant)
    if count > 0
      "#{count} other Tuesdaters have eaten here"
    else
      "Be the first Tuesdater to eat here"
    end
  end

  def restaurant_reviews(restaurant)
    if !Restaurant.has_reviews?(restaurant)
      "There are no reviews for this restaurant"
    else
      link_to "See Reviews", restaurant_reviews_path(Restaurant.find_restaurant_from_yelp_response(restaurant))
    end
  end

end
