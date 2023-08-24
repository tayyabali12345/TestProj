source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'devise'
gem 'rails', '~> 5.2.8', '>= 5.2.8.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap', '~> 5.2.2'
gem 'devise'
gem 'mini_magick'
gem 'pundit'
gem 'ransack'
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'faker'
  gem 'rails-controller-testing'
  #gem 'active_storage_validations', '~> 0.9.8'
  gem 'jsonapi-serializer'
end

group :test do
  gem 'simplecov'
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'shoulda-matchers', '~> 5.0'
end

gem 'cloudinary'
gem 'active_storage_validations'
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'select2-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'active_storage_validations'
  gem 'image_processing'
  gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
  gem 'paypal-checkout-sdk'
  gem 'paypal-recurring'
  gem 'paypal-sdk-rest'
  gem 'rails-ujs', '~> 0.1.0'
  gem 'rmagick'

  group :development, :test do
    gem 'rubocop'
    gem 'rubocop-minitest'
    gem 'rubocop-performance'
    gem 'rubocop-rails'
    gem 'dotenv-rails'
  end

  gem 'rack-cors'
  gem 'active_model_serializers', '~> 0.10.2'
end


gem "graphql", "~> 2.0"

gem 'graphiql-rails', github: "rmosolgo/graphiql-rails", group: :development
