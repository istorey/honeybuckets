class LocationsController < ApplicationController
  def home
  end

  def map
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