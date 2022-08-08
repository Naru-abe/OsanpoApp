class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :tag
  has_many :post_comments
  has_many :favorites
  has_one_attached :post_image

  def get_post_image
    (post_image.attached?) ? post_image: 'default-image.jpeg'
  end

  def self.search_for(content, method)
    Post.where('content LIKE ?', '%'+content+'%')
  end

  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end

end
