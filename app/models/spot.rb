class Spot < ApplicationRecord
  belongs_to :review

  geocoded_by :address
  after_validation :geocode
end
