require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @user = User.create!(name: "user", email: "email@email.com", password: "password", password_confirmation: "password")
    @friend = User.create!(name: "friend", email: "friend@email.com", password: "password", password_confirmation: "password")
    @Friendship = Friendship.new(user: @user, friend: @friend, status: 1)
  end
  
  context "Friendship" do
    it "with valid user" do
      expect(@Friendship).to be_valid
    end
    
    it "with invalid user" do
      @Friendship.user = nil
      expect(@Friendship).to_not be_valid
    end
    
    it "with invalid friend" do
      @Friendship.friend = nil
      expect(@Friendship).to_not be_valid
    end
    
  end
  
end
