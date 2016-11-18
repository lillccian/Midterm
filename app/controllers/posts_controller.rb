class PostsController < ApplicationController
	before_action :authenticate_user! ,:except => :index
	def index
		@posts = Post.all
	end
	def show
		@post = Post.find(params[:id])
		@comments=@post.comments
	end
	def edit
		@post = Post.find(params[:id])	
	end
	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to :action => :index
		else
			render :action => :edit
		end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end
	def new
		@post = current_user.posts.new
	end
	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to posts_path
		else
			render :actoin => :new
		end
	end


	private
	def post_params
		params.require(:post).permit(:name,:description,:user_id)
	end
end



