class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :tag
  has_many :post_comments
  has_many :favorites
  has_one_attached :post_image

  def get_post_image
    (post_image.attached?) ? post_image: 'default-image.jpeg'
  end

end
