class Position < ActiveRecord::Base
  has_one :school

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
