class LocationsController < ApplicationController
  def home

    @embed = []
    tweets = twitter_client.search("#honeybuckets").take(10)
    #converting tweets to oembed objects
    tweets.each do |tweet|
      @embed << twitter_client.oembed(tweet.id)
    end

  end

  def map
  if params[:search].present?
    @locations = Location.near(params[:search], 50, :order => :distance)
  else
    @locations = Location.all
  end
  end

  def show
    @location = Location.find(params[:id])
    @review = Review.new
    @reviews = Review.all
  end

  def new
    @location = Location.new
    @review = Review.new
  end

  def create
    
  end
end
