# frozen_string_literal: true

require 'rails_helper'

feature 'facebook' do
  scenario 'signs in user with facebook' do
    visit new_user_registration_path
    expect(page).to have_content('Log in with Facebook')
    mock_auth_hash
    click_link 'Log in with Facebook'
    expect(page).to have_content('Log out')
  end

  scenario 'signs in with invalid e-mail' do
    visit new_user_registration_path
    expect(page).to have_content('Sign in with Facebook')
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    click_link 'Log in with Facebook'
    expect(page).to have_content('Sign up')
  end
end
