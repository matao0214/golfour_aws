class Like < ApplicationRecord
  belongs_to :training_post
  belongs_to :user

  # validates_uniqueness_of :training_post_id, scope: :user_id
  validates :training_post_id, uniqueness: { scope: :user_id }
end
