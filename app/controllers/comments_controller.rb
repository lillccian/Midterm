class CommentsController < ApplicationController
  before_action :find_post
  before_action :set_own_comment, :only => [:update, :edit, :destroy]

  def index
    @comments = @post.comments
  end

  def show

  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render :action => :edit
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

  def destroy
    # 缺少刪除的action
    @comment.destroy
    flash[:notice] = "刪除成功"
    redirect_to post_path(@post)
  end

  private
  def set_own_comment
    @comment = current_user.comments.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :description)
  end
end
