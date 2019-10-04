# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user likes a post', type: :feature do
  before :each do
    @user = User.create(name: 'fatima', password: 'password',
                        password_confirmation: 'password',
                        email: 'fatima@gmail.com')
    visit new_user_session_path
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: @user.password)
    click_button('Log in')

    @post = @user.posts.create!(content: 'Random Post', image_link: 'image link')
    visit post_path(@post)
  end

  scenario 'creater of post likes successfully' do
    click_on('Like')
    expect(page).to have_content('1 like')
  end

  scenario 'another user likes a post successfully' do
    @another_user = User.create(name: 'another', email: 'another@user.com',
                                password: 'password', password_confirmation: 'password')
    click_on('Log Out')
    expect(page).to have_content('Signed out successfully.')
    visit new_user_session_path
    fill_in('user[email]', with: @another_user.email)
    fill_in('user[password]', with: @another_user.password)
    click_button('Log in')
    visit post_path(@post)
    click_on('Like')
    expect(page).to have_content('Post liked successfully')
    expect(page).to have_content('1 like')
  end
end
