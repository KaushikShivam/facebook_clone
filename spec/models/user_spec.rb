# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'example', password: 'password',
                     password_confirmation: 'password', email: 'example@gmail.com')
  end
  context 'valid user' do
    it 'has a valid name' do
      expect(@user).to be_valid
    end
    it 'has a valid image link' do
      expect(@user).to be_valid
    end
  end
  context 'invalid user' do
    it 'has an invalid name' do
      @user.name = ' '
      expect(@user).to_not be_valid
    end
  end
end
