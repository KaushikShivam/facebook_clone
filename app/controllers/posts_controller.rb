# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %i[edit update destroy show]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @posts = current_user.posts + Post.joins("INNER JOIN friendships ON posts.user_id=friendships.user_id
                                             AND friendships.friend_id=#{current_user.id}")
    @posts = @posts.sort { |a, b| b.created_at <=> a.created_at }
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
      flash[:success] = 'Post created successfully'
    else
      flash.now[:danger] = 'Post creation failed. Please enter valid information'
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post saved successfully'
      redirect_to root_path
    else
      flash.now[:danger] = 'Post update failed. Please enter valid information'
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted successfully'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :image_link)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def correct_user
    return if current_user == @post.user

    flash[:danger] = "You're not authorized to visit this page."
    redirect_to root_path
  end
end
