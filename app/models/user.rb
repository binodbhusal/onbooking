class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_one :profile, dependent: :destroy
  has_many :favroutes, dependent: :destroy
  has_many :favrouted_properties, through: :favroutes, source: :property
  has_many :reservations, dependent: :destroy
  has_many :reserved_properties, through: :reservations, source: :property
  has_many :reviews, dependent: :destroy
  after_create :create_profile

  def create_profile
    self.profile = Profile.new
    save
  end

  def full_name
    "#{first_name}#{last_name}".strip
  end
end
