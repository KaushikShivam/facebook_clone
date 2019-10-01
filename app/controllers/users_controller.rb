# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all_except(current_user)
  end

  def show; end

  def create_friendship
    @user = User.find(params[:id])
    current_user.friendships.create!(friend_id: @user.id, status: 0)
    flash[:success]="Friend added"
    redirect_to users_path
  end

  def update_friendship
    @user = User.find(params[:id])
    Friendship.find_by(user: current_user, friend: @user).accepted!
  end

  def destroy_friendship
    @user = User.find(params[:id])
    Friendship.find_by(user: current_user, friend: @user).destroy
  end
end