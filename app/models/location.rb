class Location < ActiveRecord::Base
  has_many :reviews
  after_validation :geocode, if: ->(location){ location.address.present? and obj.address_changed? }
end