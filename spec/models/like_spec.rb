# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'shivam', password: 'password',
                        password_confirmation: 'password',
                        email: 'shivam@gmail.com')
    @post = @user.posts.create(content: 'content', image_link: 'www.image.com')
    @like = @post.likes.build(user: @user)
  end

  context 'valid like' do
    it 'with valid user and post' do
      expect(@like).to be_valid
    end
  end

  context 'invalid like' do
    it 'with invalid user' do
      @like.user = nil
      expect(@like).to_not be_valid
    end

    it 'with invalid post' do
      @like.post = nil
      expect(@like).to_not be_valid
    end
  end
end
