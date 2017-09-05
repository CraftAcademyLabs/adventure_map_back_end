source 'https://rubygems.org'
ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'apipie-rails'
gem 'coffee-rails', '~> 4.2'
gem 'figaro'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rack-cors'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Functionality
gem 'acts-as-taggable-on', '~> 4.0'
gem 'acts_as_follower', github: 'thepracticaldev/acts_as_follower', branch: 'master'
gem 'aws-sdk', '~> 2'
gem 'devise'
gem 'devise_token_auth'
#gem 'godmin' # administrative interface https://github.com/varvet/godmin
gem 'admin', path: 'admin'
gem 'godmin-tags', '~> 1.0', '>= 1.0.1'
gem 'omniauth'
gem 'omniauth-facebook'

# App monitoring
gem 'oj', '~> 2.12.14'
gem 'rollbar'
gem 'scout_apm'

group :development, :test do
  gem 'awesome_print'
  gem 'capistrano', '~> 3.7', '>= 3.7.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-env-config'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rails', '~> 1.1.1'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'capybara-webkit'
  #gem 'phantomjs', require: 'phantomjs/poltergeist'
  #gem 'poltergeist'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pundit-matchers'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webmock'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
