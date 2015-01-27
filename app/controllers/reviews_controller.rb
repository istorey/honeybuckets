class ReviewsController < ApplicationController
  def create
  	if current_user
    @review = Review.new(review_params)
    @review.user_id = @current_user.id
    @review.location_id = params[:location_id].to_i
    @review.save
    redirect_to root_path
    end
  end

  def new
  	@location = Location.find(params[:id])
  	@review = Review.new
  end

  def update
  end
  
  def destroy
  end

private
  def review_params
    params.require(:review).permit(:body, :rating)
  end

end

