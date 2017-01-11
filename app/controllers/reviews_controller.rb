class ReviewsController < ApplicationController
  load_and_authorize_resource only: [:index, :new, :create]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def new
    @review = Review.new()
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.user = current_user
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.user = current_user
    @review.restaurant = @restaurant
    if @review.save
      flash[:success] = "Thank you for submitting your review"
      redirect_to restaurant_reviews_path(@restaurant)
    else
      flash[:failure] = "Your review did not save"
      render :new
    end
  end


  private

  def review_params
    params.require(:review).permit(:id, :user_id, :restaurant_id, :review_content, :stars)
  end

end
