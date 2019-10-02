# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user sends a friend request', type: :feature do
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
  end

  scenario 'successfully' do
    visit users_path
    click_on('Add friend')
    expect(page).to have_content('Friend request sent')
    expect(page).to have_content('Cancel Friend Request')
  end
end
