class Location < ActiveRecord::Base
  has_many :reviews
  reverse_geocoded_by :lat, :long
  	:adress => :location
  after_validation :reverse_geocode
  
  geocoded_by :address
  after_validation :geocode
end