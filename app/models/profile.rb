class Profile < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: -> { address.present? && latitude.blank? && longitude.blank? }

  def address
    [address1, address2, city, state, zip_code, country].compact.join(', ')
  end
end
