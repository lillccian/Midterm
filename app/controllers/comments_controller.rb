class CommentsController < ApplicationController
	before_action :find_post
	def index
		@comments = @post.comments
	end
	def show
		@comment = @post.comments.find(params[:id])
	end
	private 
	def find_post
	  @post = Post.find( params[:post_id] )
	end
end
