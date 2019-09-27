class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_post, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
      flash[:success] = "Post created successfully"
    else
      render 'new'
      flash.now[:danger] = "Post creation failed. Please enter valid information"
    end
  end
  
  def edit; end
  
  def update
    if @post.update(post_params)
      flash[:success] = "Post saved successfully"
      redirect_to root_path
    else
      render 'edit'
      flash.now[:danger] = "Post update failed. Please enter valid information"
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "Post deleted successfully"
    redirect_to root_path
  end
  
  def index
    @posts = Post.all
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :image_link)
  end
  
  def get_post
    @post = Post.find(params[:id])
  end
  
  def correct_user
    if current_user != @post.user
      flash[:danger] = "You're not authorized to visit this page."
      redirect_to root_path
    end
  end
  
end
