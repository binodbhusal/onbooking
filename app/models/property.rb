class Property < ApplicationRecord
  include Contriable
  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country_code, presence: true
  validates :address1, presence: true
  has_many_attached :images
  has_many :reviews, as: :reviewable
  has_many :favroutes, dependent: :destroy
  has_many :favrouted_users, through: :favroutes, source: :user
  has_many :reservations, dependent: :destroy
  has_many :reserved_users, through: :reservations, source: :user
  has_many :payments, through: :reservations
  belongs_to :user
  monetize :price_cents, allow_nil: true
  CLEANING_FEE = 6000
  CLEANING_FEE_MONEY = Money.new(CLEANING_FEE)
  SERVICE_FEE_PERCENT = 0.8
  delegate :full_name, to: :profile
  def address_info
    "#{city} #{state}, #{country_name}".strip
  end

  geocoded_by :address
  after_validation :geocode, if: -> { latitude.blank? && longitude.blank? }

  def address
    # [address1,address2, city, state, country].compact.join(', ')
    [state, country_name].compact.join(', ')
  end

  def favrouted_by?(user)
    return false if user.nil?

    favrouted_users.include?(user)
  end

  def available_dates()
    date_format = '%b %e'

    # Find the latest reservation for the property
    next_reservation = reservations.future_reservations.order(checkout_date: :desc).first
    return Date.tomorrow.strftime(date_format)..Date.today.end_of_year.strftime(date_format) if next_reservation.nil?

    next_reservation.checkin_date.strftime(date_format)..Date.today.end_of_year.strftime(date_format)
  end
end
