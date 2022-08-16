class Public::EndUsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @end_users = EndUser.all
  end

  def show
    @posts = @end_user.posts
  end

  def edit
  end

  def update
    @end_user.update(end_user_params)
    redirect_to end_user_path(@end_user)
  end

  def unsubscribe
    @end_user = EndUser.find(current_end_user.id)
  end

  def withdraw
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def favorites
    # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    favorites = Favorite.where(end_user_id: current_end_user.id).pluck(:post_id)
    # postsテーブルから、お気に入り登録済みのレコードを取得
    @favorite_list = Post.find(favorites)
  end

  private
  def set_user
    @end_user = EndUser.find(params[:id])
  end

  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :profile_image, :email, :is_deleted)
  end
end
