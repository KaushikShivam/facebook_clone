class UsersController < ApplicationController
  
  def index
    @users = User.all_except(current_user)
  end
  
  def show
  end
  
end
