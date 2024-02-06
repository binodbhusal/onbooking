class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :favroutes, dependent: :destroy
  has_many :favrouted_properties, through: :favroutes, source: :property

  after_create :create_profile

  def create_profile
    self.profile = Profile.new
    save
  end
end
