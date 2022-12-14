class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts=Post.page(params[:page])
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:post_image, :content, :tag_id, :station_name, :address, :latitude, :longitude)
  end
end
