class CommentsController < ApplicationController
	before_action :set_post, only: %i(create destroy)
	def create
		byebug
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
		redirect_to post_path(@post)
	end
end
