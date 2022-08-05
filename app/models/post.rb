class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :tga, optional: true
  has_one_attached :post_image

  def get_post_image
    (post_image.attached?) ? post_image: 'default-image.jpeg'
  end

end
