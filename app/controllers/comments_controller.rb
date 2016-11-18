class CommentsController < ApplicationController
	before_action :find_post
	def index
		@comments = @post.comments
	end
	def show
		@comment = @post.comments.find(params[:id])
	end
	def edit
		@comment = @post.comments.find(params[:id])
	end
	def update
		@comment = @post.comments.find(params[:id])
		if @comment.update(comment_params)	
			redirect_to post_path(@post)
		else
			render :action =>:edit
		end
	end

	private 
	def find_post
	  @post = Post.find(params[:post_id])
	end
	def comment_params
		params.require(:comment).permit(:name,:description)
	end
end
