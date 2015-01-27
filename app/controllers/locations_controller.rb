class LocationsController < ApplicationController
  def home
    @tweets = twitter_client.search("#honeybucket").take(3) 
  end

  def map
  end

  def show
  end

  def new
  end

  def create
  end
end
