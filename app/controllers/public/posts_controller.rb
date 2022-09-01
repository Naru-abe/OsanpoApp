class Public::PostsController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, only: [:edit, :update, :destroy]

  def index
    #present?メソッドでtag_idの存在チェック
    if params[:tag_id].present?
      # 退会ステータスが有効のユーザーを取得
      end_users = EndUser.where(is_deleted: false)
      # postsテーブルから、退会ステータスが有効のユーザーの投稿のレコードを取得
      @posts = Tag.find(params[:tag_id]).posts.where(end_user: end_users).page(params[:page])
    else
      end_users = EndUser.where(is_deleted: false)
      @posts = Post.where(end_user: end_users).page(params[:page])
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.end_user_id = current_end_user.id
    if @post.save
      tags = Vision.get_image_data(@post.post_image)
      tags.each do |tag|
        @post.vision_tags.create(name: tag)
      end
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
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:notice] = "変更を完了しました"
    else
      redirect_to edit_post_path(@post)
      flash[:notice] = "項目を入力してください"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:notice] = "投稿を削除しました"
  end

  def searchstation
    station_name = params[:station_name]
    @posts = Post.where(station_name: station_name).page(params[:page])
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
