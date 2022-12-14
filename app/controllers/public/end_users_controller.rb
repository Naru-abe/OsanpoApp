class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def index
    @end_users = EndUser.page(params[:page])
  end

  def show
    @posts = @end_user.posts.page(params[:page]).per(15)
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user)
      flash[:notice] = "変更を完了しました"
    else
      redirect_to edit_end_user_path(@end_user)
      flash[:notice] = "項目を入力してください"
    end
  end

  def unsubscribe
    @end_user = EndUser.find(current_end_user.id)
  end

  def withdraw
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました。ご利用ありがとうございました。"
    redirect_to root_path
  end

  def favorites
    # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    favorites = Favorite.where(end_user_id: current_end_user.id).pluck(:post_id)
    # postsテーブルから、お気に入り登録済みのレコードを取得
    @favorite_list = Post.where(id: favorites).page(params[:page]).per(15)
  end

  private
  def set_user
    @end_user = EndUser.find(params[:id])
  end

  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :profile_image, :email, :is_deleted)
  end

  def ensure_correct_user
    @end_user = EndUser.find(params[:id])
    unless @end_user == current_end_user
      redirect_to end_user_path(current_end_user)
    end
  end

  def ensure_guest_user
    @user = EndUser.find(params[:id])
    if @user.name == "guestuser"
      redirect_to end_user_path(current_end_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
