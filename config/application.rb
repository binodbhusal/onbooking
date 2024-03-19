require_relative "boot"

require "rails/all"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Onbooking
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.stripe.secret_key = ENV["STRIPE_SECRET_KEY"]
    config.stripe.publishable_key = ENV["STRIPE_PUBLISHABLE_KEY"]
    # config/application.rb

# Load the GCS service account key file from the environment variable
if ENV['GOOGLE_APPLICATION_CREDENTIALS'].present?
  config.google_cloud_storage = {
    service: 'GCS',
    credentials: JSON.parse(ENV['GOOGLE_APPLICATION_CREDENTIALS']),
    project: 'onbooking',
    bucket: 'onbooking_bucket'
  }
end

  end
end
