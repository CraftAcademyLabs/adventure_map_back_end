Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']

  # Here we'll disable in 'test' or 'development':
  config.enabled = false if Rails.env.test? || Rails.env.development?

  config.environment = ENV['ROLLBAR_ENV'] || Rails.env
end
