class Spot < ApplicationRecord
  belongs_to :training_post

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :address, presence: true, length: { maximum: 50 }
end
