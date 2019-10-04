# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.build(user: current_user)
    @like.save
    flash[:notice] = 'Post liked successfully'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.delete
    flash[:notice] = 'Post unliked successfully'
    redirect_back(fallback_location: root_path)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
