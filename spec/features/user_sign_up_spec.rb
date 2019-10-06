# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user signup', type: :feature do
  scenario 'signs up the user correctly' do
    visit new_user_registration_path
    fill_in('user[name]', with: 'Example')
    fill_in('user[email]', with: 'example@email.com')
    fill_in('user[password]', with: 'foobar')
    fill_in('user[password_confirmation]', with: 'foobar')
    click_button('Sign up')
    expect(page).to have_content('Log out')
  end
end
