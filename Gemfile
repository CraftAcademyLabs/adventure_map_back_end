source 'https://rubygems.org'
ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'rack-cors'
gem 'haml-rails'

# Functionality
gem 'godmin' # administrative interface https://github.com/varvet/godmin
gem 'devise_token_auth'
gem 'omniauth'


group :development, :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'launchy'
  gem 'pundit-matchers'
  gem 'poltergeist'
  gem 'phantomjs', require: 'phantomjs/poltergeist'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
