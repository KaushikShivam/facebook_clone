# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user accepts a friend request', type: :feature do
  before :each do
    @user = User.create(name: 'fatima', password: 'password',
                        password_confirmation: 'password',
                        email: 'fatima@gmail.com')
    @friend = User.create(name: 'shivam', password: 'password',
                          password_confirmation: 'password',
                          email: 'shivam@gmail.com')
    visit new_user_session_path
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: @user.password)
    click_button('Log in')
    visit users_path
    click_on('Add friend')
    click_on('Log Out')
  end

  scenario 'successfully' do
    fill_in('user[email]', with: @friend.email)
    fill_in('user[password]', with: @friend.password)
    click_button('Log in')
    visit user_friend_requests_path(@friend)
    click_on('Accept Friend Request')
    expect(page).to have_content('Friend added')
  end
end
