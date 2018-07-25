# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'async_sinatra'
gem 'carrierwave', '~> 1.0'
gem 'interactor', '~> 3.0'
gem 'oj'
gem 'oj_mimic_json'
gem 'pg'
gem 'rack-mount'
gem 'rake'
gem 'require_all'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sinatra-param', require: 'sinatra/param'
gem 'thin'

group :development, :test do
  gem 'pry'
  gem 'rspec'
  gem 'webmock'
end

group :development do
  gem 'rubocop', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
