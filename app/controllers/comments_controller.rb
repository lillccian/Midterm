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
  def new
  	@comment = @post.comments.new
  end
	def create 
		@comment = @post.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to post_path(@post)
		else
			render :action => :new
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
