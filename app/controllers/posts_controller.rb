class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def show
		@post = Post.find(params[:id])
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


	private
	def post_params
		params.require(:post).permit(:name,:description)
	end
end



