class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :post

  # バリデーション（ユーザーと記事の組み合わせは一意）
  # 同じ投稿を複数回お気に入り登録させないため
  validates_uniqueness_of :post_id, scope: :end_user_id
end
