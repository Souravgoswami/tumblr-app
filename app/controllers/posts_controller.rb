class PostsController < ApplicationController
	before_action :set_post, only: %i(show)

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to @post
	end

	def show
	end

	private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

end
