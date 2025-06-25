# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'foreman'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.2.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'annotate'
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'dotenv'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 8.0.1'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers', '~> 6.0'
  gem 'simplecov', require: false
end
