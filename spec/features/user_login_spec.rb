require 'rails_helper'

RSpec.describe 'user login', type: :feature do
    before :each do
        @user = User.create(name: "fatima", password: "password",password_confirmation: "password", email: "fatima11@gmail.com", image_link: "jfiehbn")
    end

    scenario 'user login correctly' do
      visit new_user_session_path
      fill_in('user[email]', with: @user.email)
      fill_in('user[password]', with: @user.password)
      click_button('Log in')
      expect(page).to have_content('Signed in successfully')
    end
  end
