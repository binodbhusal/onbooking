# config/initializers/google_cloud.rb

if Rails.env.production?
    require "google/cloud/storage"
  
    gcs_credentials = ENV["GCS_CREDENTIALS"]
    decoded_credentials = Base64.decode64(gcs_credentials)
    json_credentials = JSON.parse(decoded_credentials)
  
    Google::Cloud::Storage.configure do |config|
      config.credentials = json_credentials
    end
  end
  