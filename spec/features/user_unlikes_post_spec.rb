# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user unlikes a post', type: :feature do
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
    click_on('Like')
    expect(page).to have_content('1 like')
  end

  scenario 'successfully' do
    click_on('Unlike')
    expect(page).to have_content('0 likes')
  end
end
