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
    redirect_to end_user_path(end_user)
  end

  def unsubscribe
    @end_user = EndUser.find(current_end_user.id)
  end

  def withdraw
    @end_user = EndUser.find(current_end_user.id)
  end

  private
  def set_user
    @end_user = EndUser.find(params[:id])
  end

  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :profile_image, :email, :is_deleted)
  end
end
