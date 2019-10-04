# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user creates post', type: :feature do
  before :each do
    @user = User.create(name: 'fatima', password: 'password',
                        password_confirmation: 'password',
                        email: 'fatima11@gmail.com')
    visit new_user_session_path
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: @user.password)
    click_button('Log in')
  end

  scenario 'creates post successfully' do
    visit new_post_path
    fill_in('post[content]', with: 'content')
    fill_in('post[image_link]', with: 'www.image.com')
    click_button('Submit')
    expect(page).to have_content('Post created successfully')
  end

  scenario 'creates post unsuccessfully' do
    visit new_post_path
    fill_in('post[content]', with: '')
    fill_in('post[image_link]', with: '')
    click_button('Submit')
    expect(page).to have_content('Post creation failed. Please enter valid information')
  end
end
