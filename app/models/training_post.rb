class TrainingPost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_one :spot, dependent: :destroy
  has_one :training_content, dependent: :destroy
  accepts_nested_attributes_for :spot, :training_content
  
  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    %w[training_advance training_task training_impression]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  
  validates :training_impression, length: { maximum: 150 }
end
