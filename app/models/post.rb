class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :tag
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :vision_tags, dependent: :destroy
  has_one_attached :post_image

  validates :content, presence:true, length:{maximum:200}
  validates :station_name, presence:true
  validates :post_image, presence:true

  geocoded_by :address
  after_validation :geocode

  def get_post_image
    (post_image.attached?) ? post_image: 'default-image.jpg'
  end

  def self.search_for(content, method)
    Post.where('content LIKE ?', '%'+content+'%')
  end

  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end

end
