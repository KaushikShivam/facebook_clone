require 'rails_helper'

RSpec.describe 'user edits post', type: :feature do
    before :each do
      @user = User.create(name: "fatima", password: "password",password_confirmation: "password", email: "fatima11@gmail.com", image_link: "jfiehbn")
      visit new_user_session_path
      fill_in('user[email]', with: @user.email)
      fill_in('user[password]', with: @user.password)
      click_button('Log in')
    end

    scenario 'edits post successfully' do
      visit new_post_path
      fill_in('post[content]', with: 'content')
      fill_in('post[image_link]', with: 'www.image.com')
      expect(page).to have_content('Post saved successfully')
    end

    scenario 'edits post unsuccessfully' do
      visit new_post_path
      fill_in('post[content]', with: '')
      fill_in('post[image_link]', with: '')
      expect(page).to have_content('Post update failed. Please enter valid information')
    end
    
end
