class Property < ApplicationRecord
  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :address1, presence: true

  monetize :price_cents, allow_nil: true

  def address_info
    "#{city} #{state}, #{country}".strip
  end

  geocoded_by :address
  after_validation :geocode, if: -> { latitude.blank? && longitude.blank? }

  def address
    # [address1,address2, city, state, country].compact.join(', ')
    [state, country].compact.join(', ')
  end
end
