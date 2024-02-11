require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:profile).dependent(:destroy) }
  it { should have_many(:favroutes).dependent(:destroy) }
  it { should have_many(:favrouted_properties).through(:favroutes).source(:property) }
  it { should have_many(:reservations).dependent(:destroy) }
  it { should have_many(:reserved_properties).through(:reservations).source(:property) }
  it { should have_many(:reviews).dependent(:destroy) }
end
