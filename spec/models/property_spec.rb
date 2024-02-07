# property_spec.rb

require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:headline) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:address1) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:country) }
    it { is_expected.to monetize(:price).allow_nil }
    it { should have_many(:reviews) }
    it { should have_many(:favroutes).dependent(:destroy) }
    it { should have_many(:favrouted_users).through(:favroutes).source(:user) }
    it { should have_many(:reserved_users).through(:reservations).source(:user) }
  end
end
