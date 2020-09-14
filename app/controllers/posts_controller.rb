class PostsController < ApplicationController
	before_action :set_post, only: %i(show edit update destroy)
	before_action :authenticate_user!, except: %i(index show)
	before_action :require_same_user, only: %i(edit update destroy)

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user

		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def require_same_user
		if user_signed_in? && current_user != @post.user
			redirect_to root_path
			flash[:warning] = 'You do not have right to edit this post'
		end
	end

end
