class Public::SearchesController < ApplicationController
  before_action :authenticate_end_user!

	def search
		@model = params[:model]
		@content = params[:content]
		if @model == 'end_user'
			end_users = EndUser.where(is_deleted: false)
			@records = end_users.search_for(@content, @method).page(params[:page])
		else
			end_users = EndUser.where(is_deleted: false)
      @posts = Post.where(end_user: end_users).page(params[:page])
			@records = @posts.search_for(@content, @method).page(params[:page])
		end
	end
end
