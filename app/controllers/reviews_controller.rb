class ReviewsController < ApplicationController
  def create
  	
  end

  def new
  	@location = Location.find(params[:id])
  	@review = Review.new
  end

  def update
  end
  
  def destroy
  end
end