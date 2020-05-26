class User < ApplicationRecord
  has_secure_password

  validates :nickname, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true
  validates :goal, length: { maximum: 50 }

  has_many :training_posts
end
