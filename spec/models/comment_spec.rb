# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'shivam', password: 'password',
                        password_confirmation: 'password',
                        email: 'shivam@gmail.com')
    @user.reload
    @post = @user.posts.new(content: 'content', image_link: 'www.image.com')
    @comment = Comment.new(content: 'content', user: @user, post: @post)
  end

  context 'valid comment' do
    it 'with valid content' do
      expect(@comment).to be_valid
    end
  end

  context 'invalid comment' do
    it 'with invalid content' do
      @comment.content = ''
      expect(@comment).to_not be_valid
    end

    it 'with invalid user' do
      @comment.user = nil
      expect(@comment).to_not be_valid
    end

    it 'with invalid post' do
      @comment.post = nil
      expect(@comment).to_not be_valid
    end
  end
end
