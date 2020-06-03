class User < ApplicationRecord
  has_secure_password

  validates :nickname, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true
  validates :goal, length: { maximum: 50 }

  has_many :training_posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :training_post

  def own?(user)
    self == user
  end

  def already_liked?(post)
    self.likes.exists?(training_post_id: post.id)
  end
end
