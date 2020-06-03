class TrainingPost < ApplicationRecord
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    %w[training_place training_advance training_task training_impression]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  # def own_post?(post)
  #   self.id == post.user_id
  # end

  validates :training_place, presence: true, length: { maximum: 50 }
  validates :training_advance, presence: true, length: { maximum: 150 }
  validates :training_task, presence: true, length: { maximum: 150 }
  validates :training_impression, length: { maximum: 150 }
end
