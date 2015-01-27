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
    # @ip_address = request.remote_ip
    @ip_address = "50.200.196.50"
  if params[:search].present?
    @locations = Location.near(params[:search], 50, :order => :distance)
  else
    @locations = Location.all
  end
  end

  def show
    @location = Location.new(lat:0, long:0)
  end

  def new
  end

  def create
    
  end
end
