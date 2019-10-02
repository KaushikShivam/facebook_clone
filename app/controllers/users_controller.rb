# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all_except(current_user)
  end

  def show
    @user = current_user
    @posts = @user.posts
  end

  def showrequests
    @requested_friends = User.joins('INNER JOIN friendships ON users.id=friendships.friend_id
                                    AND friendships.status=1').where.not('users.id=?', current_user.id).distinct
  end

  def create_friendship
    @user = User.find(params[:id])
    current_user.friendships.create!(friend_id: @user.id, status: 0)
    flash[:success] = 'Friend request sent'
    redirect_to users_path
  end

  def update_friendship
    @user = User.find(params[:id])
    Friendship.find_by(user: current_user, friend: @user).accepted!
    flash[:success] = 'Friend added'
    redirect_to users_path
  end

  def destroy_friendship
    @user = User.find(params[:id])
    Friendship.find_by(user: current_user, friend: @user).destroy
    flash[:success] = 'Friend request deleted'
    redirect_to users_path
  end
end
