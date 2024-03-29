require 'simplecov'
require 'cucumber/rails'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group)'\
        ' if you wish to use it.'
end

Cucumber::Rails::Database.javascript_strategy = :truncation

# Capybara.register_driver :poltergeist do |app|
#   Capybara::Poltergeist::Driver.new(app, js_errors: true, timeout: 30)
# end

Capybara::Webkit.configure do |config|
  # Enable debug mode. Prints a log of everything the driver is doing.
  #config.debug = true

  # By default, requests to outside domains (anything besides localhost) will
  # result in a warning. Several methods allow you to change this behavior.

  # Silently return an empty 200 response for any requests to unknown URLs.
  #config.block_unknown_urls

  # Allow pages to make requests to any URL without issuing a warning.
  #config.allow_unknown_urls

  # Allow a specific domain without issuing a warning.
  #config.allow_url("example.com")

  # Allow a specific URL and path without issuing a warning.
  #config.allow_url("example.com/some/path")

  # Wildcards are allowed in URL expressions.
  #config.allow_url("*.example.com")

  # Silently return an empty 200 response for any requests to the given URL.
  #config.block_url("example.com")

  # Timeout if requests take longer than 5 seconds
  config.timeout = 5

  # Don't raise errors when SSL certificates can't be validated
  config.ignore_ssl_errors

  # Don't load images
  #config.skip_image_loading

  # Use a proxy
  #config.use_proxy(
  #    host: "example.com",
  #    port: 1234,
  #    user: "proxy",
  #    pass: "secret"
  #)

  # Raise JavaScript errors as exceptions
  config.raise_javascript_errors = true
end

Capybara.javascript_driver = :webkit
Capybara.default_max_wait_time = 10