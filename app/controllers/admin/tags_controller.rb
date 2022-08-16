class Admin::TagsController < ApplicationController
  before_action :ensure_correct_tag, only: [:edit, :update, :destroy]

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admin_tags_path
  end

  def edit
  end

  def update
    @tag.update(tag_params)
    redirect_to admin_tags_path
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def ensure_correct_tag
    @tag = Tag.find(params[:id])
  end
end
