class LocationsController < ApplicationController
  def home

    @embed = []
    tweets = twitter_client.search("#honeybucket").take(3)
    #converting tweets to oembed objects
    tweets.each do |tweet|
      @embed << twitter_client.oembed(tweet.id)
    end

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
