class Like < ApplicationRecord
  belongs_to :training_post
  belongs_to :user

  validates :training_post_id, uniqueness: { scope: :user_id }
end
