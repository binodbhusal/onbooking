require 'rails_helper'

RSpec.describe 'Properties:Reservations', type: :request do
  describe 'GET new' do
    let(:property) { create(:property) }
    it 'success' do
      get new_property_reservation_path(property, params: {
                                          checkin_date: '10/31/2022',
                                          checkout_date: '11/4/2022'
                                        })
    end
  end
end
