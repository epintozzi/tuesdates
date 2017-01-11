module RatingHelper

  def stars_for_rating(rating)
    (1..5).map do |i|
      if i <= rating
        image_tag("Star", class: "rating-star")
      else
        image_tag("Star_outline", class: "rating-star")
      end
    end.join("").html_safe
  end
end
