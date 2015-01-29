class LocationsController < ApplicationController
  protect_from_forgery

  def home
    #@embed = []
    #@honey_embed = []
    #tweets = twitter_client.search("q", :geocode => "38.9282240,-77.0604150,10mi").take(10)
    #honey = twitter_client.search("honeybuckets").take(10)
    #converting tweets to oembed objects
    #tweets.each do |tweet|
    #  @embed << twitter_client.oembed(tweet.id)
    #end
    #honey.each do |tweet|
    #  @honey_embed << twitter_client.oembed(tweet.id)
   # end
  #end
@honey_embed = []
    honey = twitter_client.search("#honeybuckets").take(3)
    honey.each do |tweet|
      @honey_embed << twitter_client.oembed(tweet.id, options = {:hide_media => true, :hide_thread => true})
    end
  end
  def map
    @geojson = { locations: []}

    if params[:search] && params[:search] != ""
      @search = params[:search]
      @coordinates = Geocoder.search(@search)[0].data["geometry"]["location"]
      @geojson[:search] = {
        latitude: @coordinates["lat"],
        longitude: @coordinates["lng"]
      }
    else
      @search = false
    end


    @locations = Location.all
    @locations.each do |location|
      rating = location.reviews.average(:rating)
      @geojson[:locations] << {
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
            :'marker-size' => 'medium',
            :'url' => location_path(location),
            :'rating' => rating
          }
        }
    end

    @honey_embed = []
    honey = twitter_client.search("Washington D.C.").take(10)
    honey.each do |tweet|
      @honey_embed << twitter_client.oembed(tweet.id, options = {:hide_media => true, :hide_thread => true})
    end

    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
  end

  def show
    @location = Location.find(params[:id])
    @review = Review.new
    @this = Review.last
    @reviews = Review.where(location_id: params[:id])
    current_ratings = @reviews.pluck(:rating)
    @rating = current_ratings.inject{ |sum, rate| sum + rate}.to_f / current_ratings.size

    @geojson = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [@location.long, @location.lat]
          },
          properties: {
            name: @location.name,
            address: @location.address,
            :'marker-color' => '#00607d',
            :'marker-symbol' => 'circle',
            :'marker-size' => 'medium',
            :'url' => location_path(@location),
            :'rating' => @rating
          }
        }

    if current_user
      @user = User.find(session[:user_id])
    else
      @user = User.new(name: "guest")
    end

    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
  end

  def new
    @location = Location.new
    @review = Review.new
  end

  def create
    @location = Location.new(location_params)
    @address_components = Geocoder.search("#{@location.lat}, #{@location.long}")[0].data["address_components"]
    @street_num = @address_components[0]["long_name"]
    @street = @address_components[1]["long_name"]
    @location.address = @street_num + " " + @street
    @location.save

    respond_to do |format|
      format.html
      format.json { render :json => {location: location_path(@location)} }
    end
  end

private
  def location_params
    params.require(:location).permit(:name, :lat, :long)
  end
end
