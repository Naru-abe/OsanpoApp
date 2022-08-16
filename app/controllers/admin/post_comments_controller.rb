class Admin::PostCommentsController < ApplicationController
  def index
    @post_comments = PostComment.page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
    @post_comments = @end_user.post_comments
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_post_comments_path
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
