# frozen_string_literal: true

module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      'provider' => 'facebook',
      'uid' => '123545',
      'info' => {
        'name' => 'mockuser',
        'email' => 'mockuser@test.com'
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret'
      }
    )
  end
end
