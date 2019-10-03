# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user deletes post', type: :feature do
  before :each do
    @user = User.create(name: 'fatima', password: 'password',
                        password_confirmation: 'password',
                        email: 'fatima11@gmail.com')
    @post = @user.posts.create(content: 'content')
    visit new_user_session_path
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: @user.password)
    click_button('Log in')
    visit post_path(@post)
  end

  scenario 'deletes post successfully' do
    click_on('Delete post')
    expect(page).to have_content('Post deleted successfully')
  end
end
