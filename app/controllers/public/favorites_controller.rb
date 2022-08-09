class Public::FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_end_user!

  def create
    @favorite = current_end_user.favorites.new(post_id: @post.id)
    @favorite.save
    render 'replace_btn'
  end

  def destroy
    @favorite = current_end_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    render 'replace_btn'
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
