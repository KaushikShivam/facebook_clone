# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user deletes comment', type: :feature do
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

    fill_in('comment[content]', with: 'What a post!')
    click_button('Submit')
    expect(page).to have_content('What a post!')
  end

  scenario 'successfully' do
    click_button('Delete comment')
    expect(page).to have_content('Comment deleted successfully!')
  end

  scenario 'unsuccessfully with hidden delete button' do
    click_on('Log Out')
    expect(page).to have_content('Signed out successfully.')

    @other_user = User.create(name: 'shivam', password: 'password',
                              password_confirmation: 'password',
                              email: 'shivam@gmail.com')
    visit new_user_session_path
    fill_in('user[email]', with: @other_user.email)
    fill_in('user[password]', with: @other_user.password)
    click_button('Log in')
    visit post_path(@post)
    expect(page).to_not have_content('Delete comment')
  end
end
