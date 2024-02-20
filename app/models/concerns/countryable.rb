module Countryable
  def country_name
    country = ISO3166::Country[country_code]
    return country.translations[I18n.locale.to_s] || country.common_name || country.iso_short_name if country&.respond_to?(:translations)
  end
end
