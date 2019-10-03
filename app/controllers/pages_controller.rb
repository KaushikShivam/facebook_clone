class PagesController < ApplicationController
  
  def home
    @suggested_people = (User.all_except(current_user) - current_user.friends).first(10)
    
  end
  
end
