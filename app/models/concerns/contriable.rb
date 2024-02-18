module Contriable
  def country_name
    country = ISO3166::Country[country_code]
    return country.name if country.present? && country.respond_to?(:name)

    'Portugal'
  end
end
