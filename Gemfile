source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.8'
gem 'pg'

group :assets do
  gem 'sass-rails'
  gem 'compass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'bootstrap-sass', '~> 2.0.4.0'
  gem 'font-awesome-sass-rails'
  gem 'modernizr-rails'
end

gem 'jquery-rails'
gem 'ember-rails'

# dev helping

group :development do
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'taps', require: false
end

group :development, :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rspec-rails'
  gem 'spork'
  gem 'quiet_assets'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end

# server
gem 'thin'
gem 'foreman'
