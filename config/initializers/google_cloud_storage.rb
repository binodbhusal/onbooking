# config/initializers/google_cloud_storage.rb

if ENV["GCS_CREDENTIALS"].present?
    gcs_credentials = JSON.parse(Base64.decode64(ENV["GCS_CREDENTIALS"]))
    Rails.application.config.gcs_credentials = gcs_credentials
  end
  