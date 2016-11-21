class PostsController < ApplicationController
  before_action :authenticate_user!, :except => :index
  before_action :set_post , :only => [:show]
  before_action :set_own_post , :only => [:update , :edit, :destroy]
  def index
    @posts = Post.page(params[:page]).per(5)
  end

  def show
    @comments=@post.comments
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "update success"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = "destroy success"
    @post.destroy
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "create success"
      redirect_to posts_path
    else
      render :action => :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :description, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_own_post
    @post = current_user.posts.find(params[:id])
  end
end



