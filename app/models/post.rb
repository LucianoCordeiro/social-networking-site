class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  has_many :likes
  has_many :comments

  def liked_by_user?(user)
    likes.where(user: user).present?
  end
end
