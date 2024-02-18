class Profile < ApplicationRecord
  include Contriable
  belongs_to :user
  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: -> { address.present? && latitude.blank? && longitude.blank? }

  def address
    [address1, address2, city, state, zip_code, country_name].compact.join(', ')
  end

  def full_name
    "#{first_name} #{last_name}".squish
  end
end
