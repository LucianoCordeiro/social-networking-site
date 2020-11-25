class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  has_many :likes

  def liked_by_user?(user)
    likes.where(user: user).present?
  end
end
