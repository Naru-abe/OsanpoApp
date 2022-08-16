class Public::PostsController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, only: [:edit, :update, :destroy]

  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts.page(params[:page]) : Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.end_user_id = current_end_user.id
    if @post.save
      redirect_to post_path(@post)
      flash[:notice] = "投稿しました"
    else
      redirect_to new_post_path
      flash[:notice] = "項目を入力してください"
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def searchstation
    station_name = params[:station_name]
    @posts = Post.where(station_name: station_name)
  end

  private
  def post_params
    params.require(:post).permit(:post_image, :content, :tag_id, :station_name, :address, :latitude, :longitude)
  end

  def ensure_correct_end_user
    @post = Post.find(params[:id])
    unless @post.end_user == current_end_user
      redirect_to posts_path
    end
  end
end
