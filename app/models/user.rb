class User < ApplicationRecord
  has_secure_password

  validates :nickname, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true
  validates :goal, length: { maximum: 50 }

  has_many :training_posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :training_post

  GUEST_EMAIL = 'guest@example.com'.freeze

  def own?(user)
    self == user
  end

  def own_post?(post)
    id == post.user_id
  end

  def already_liked?(post)
    likes.exists?(training_post_id: post.id)
  end
end
