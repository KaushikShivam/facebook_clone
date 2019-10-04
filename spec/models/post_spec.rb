# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'shivam', password: 'password',
                        password_confirmation: 'password',
                        email: 'shivam@gmail.com')
    @user.reload
    @post = @user.posts.new(content: 'content', image_link: 'www.image.com')
  end

  context 'valid post' do
    it 'has valid content' do
      expect(@post).to be_valid
    end

    it 'has valid image link' do
      expect(@post).to be_valid
    end
  end

  context 'valid post with no image' do
    it 'has no image link' do
      @post.image_link = ''
      expect(@post).to be_valid
    end
  end

  context 'invalid post' do
    it 'with invalid content' do
      @post.content = ''
      expect(@post).to_not be_valid
    end
  end
end
