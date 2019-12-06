# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.6.3'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'pg', '0.20.0'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.1.6'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Project Dependencies
gem 'bcrypt', '3.1.12'
gem 'bootstrap', '~> 4.0.0'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'dotenv-rails', '~> 2.1', '>= 2.1.2'
gem 'faker', '1.7.3'
gem 'gravatar_image_tag', '~> 1.2'
gem 'jquery-rails', '4.3.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'omniauth-facebook'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
