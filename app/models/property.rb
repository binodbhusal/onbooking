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
  has_many :reservations, dependent: :destroy
  has_many :reserved_users, through: :reservations, source: :user
  monetize :price_cents, allow_nil: true
  CLEANING_FEE = 6000.freeze
  CLEANING_FEE_MONEY = Money.new(CLEANING_FEE)
  SERVICE_FEE_PERCENT = (0.8).freeze
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

  def available_dates
    date_format = '%b %e'
    next_reservation = reservations.where('reservation_date > ?', Date.today).order(:reservation_date).first
    return Date.tomorrow.strftime(date_format)..Date.today.end_of_year.strftime(date_format) if next_reservation.nil?

    Date.tomorrow.strftime(date_format)..next_reservation.reservation_date.strftime(date_format)
  end
end
