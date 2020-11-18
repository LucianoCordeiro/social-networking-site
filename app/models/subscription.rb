class Subscription < ApplicationRecord
  belongs_to :followed, class_name: 'User'
  belongs_to :followed_by, class_name: 'User'
end
