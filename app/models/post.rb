class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :tag
  has_one_attached :image
  has_many :post_comments
  has_many :favorites
end
