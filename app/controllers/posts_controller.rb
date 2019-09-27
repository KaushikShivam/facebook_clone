class PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
      flash[:notice] = "Post created successfully"
    else
      render 'new'
      flash.now[:alert] = "Post creation failed. Please enter valid information"
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def index
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :image_link)
  end
  
  def get_post
    @post = Post.find(params[:id])
  end
  
end
