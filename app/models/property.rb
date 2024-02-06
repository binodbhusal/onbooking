class Property < ApplicationRecord
  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :address1, presence: true

  has_many_attached :images
  has_many :reviews, as: :reviewable
  has_many :favroutes, dependent: :destroy
  has_many :favrouted_users, through: :favroutes, source: :user

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

  def favrouted_by?(user)
    return false if user.nil?

    favrouted_users.include?(user)
  end
end
