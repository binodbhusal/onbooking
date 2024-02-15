require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validate reservation' do
    it { should belong_to(:user) }
    it { should belong_to(:property) }
    it { should have_one(:payment).dependent :destroy }
    it { should validate_presence_of(:checkin_date) }
    it { should validate_presence_of(:checkout_date) }
  end
end
