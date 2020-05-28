class TrainingPost < ApplicationRecord
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  validates :training_place, presence: true, length: { maximum: 50 }
  validates :training_advance, presence: true, length: { maximum: 150 }
  validates :training_task, presence: true, length: { maximum: 150 }
  validates :training_impression, length: { maximum: 150 }
end
