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
    # if params[:search].present?
    #   @locations = Location.near(params[:search], 50, :order => :distance)
    # else
    #   @locations = Location.all
    # end
    # Latitude: 38.903891736417684<br />Longitude: -77.0342230796814
    @locations = Location.all
    @geojson = []
    @locations.each do |location|
      @geojson << {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [location.long, location.lat]
          },
          properties: {
            name: location.name,
            address: location.address,
            :'marker-color' => '#00607d',
            :'marker-symbol' => 'circle',
            :'marker-size' => 'medium'
          }
        }
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
  end

  def show
    @location = Location.find(params[:id])
    @review = Review.new
    @reviews = Review.all
    current_reviews = Review.where(location_id: params[:id])
    current_ratings = current_reviews.pluck(:rating)
    @rating = current_ratings.inject{ |sum, rate| sum + rate}.to_f / current_ratings.size

  end

  def new
    @location = Location.new
    @review = Review.new
  end

  def create

  end
end
