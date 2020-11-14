# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'

group :development, :test do
  gem 'bullet', '~> 6.1'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.14'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'rubocop', '~> 1.3', require: false
  gem 'rubocop-performance', '~> 1.8', '>= 1.8.1', require: false
  gem 'rubocop-rails', '~> 2.8', '>= 2.8.1', require: false
  gem 'rubocop-rspec', '~> 2.0', require: false
end

group :development do
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  gem 'brakeman', require: false
  gem 'bundler-audit', '~> 0.7.0.1', require: false
  gem 'fasterer', require: false
  gem 'listen', '~> 3.2'
  gem 'rails_best_practices', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
  gem 'simplecov', '~> 0.19.1', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
