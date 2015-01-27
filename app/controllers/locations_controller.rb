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
  end

  def show
  end

  def new
  end

  def create
  end
end
