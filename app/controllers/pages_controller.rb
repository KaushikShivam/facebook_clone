# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @suggested_people = (User.all_except(current_user) - current_user.friends).first(10)
    @friends = current_user.friends
    @new_post = Post.new

    @posts = Post.all
  end
end
