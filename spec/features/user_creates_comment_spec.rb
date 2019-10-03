# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user creates comment', type: :feature do
  before :each do
    @user = User.create(name: 'fatima', password: 'password',
                        password_confirmation: 'password',
                        email: 'fatima11@gmail.com')
    visit new_user_session_path
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: @user.password)
    click_button('Log in')

    @post = @user.posts.create!(content: 'Random Post', image_link: 'image link')
    visit post_path(@post)
  end

  scenario 'successfully' do
    fill_in('comment[content]', with: 'What a post!')
    click_button('Submit')
    expect(page).to have_content('What a post!')
  end

  scenario 'unsuccessfully' do
    fill_in('comment[content]', with: '')
    click_button('Submit')
    expect(page).to have_content('Comment creation failed')
  end
end
