class Location < ActiveRecord::Base
  has_many :reviews
  reverse_geocoded_by :lat, :long,
  	:address => :location
  #after_validation :reverse_geocode
  
  geocoded_by :address, :latitude => :lat, :longitude => :long
  # after_validation :geocode

end