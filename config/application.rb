require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AdventureMap
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_mailer.default_url_options = { host: 'http://localhost' }
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # We need to block this to only the known domains we are working with.
        resource '*',
                 headers: :any,
                 expose: %w(access-token expiry token-type uid client),
                 methods: [:get, :post, :options, :delete, :put]
      end
    end
  end
end
