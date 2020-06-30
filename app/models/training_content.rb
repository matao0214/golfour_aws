class TrainingContent < ApplicationRecord
  belongs_to :training_post

  validates :training_time, presence: true
  validates :training_hits, presence: true
end
