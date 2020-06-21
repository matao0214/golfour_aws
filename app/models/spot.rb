class Spot < ApplicationRecord
  belongs_to :training_post

  geocoded_by :address
  after_validation :geocode
end
