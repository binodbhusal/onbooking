require 'rails_helper'

RSpec.describe 'ReservationPayments', type: :request do
  let(:user_stripe_id) { SecureRandom.uuid }
  let(:user) { create(:user, stripe_id: SecureRandom.uuid) }
  let(:property) { create(:property) }
  let(:payment_params) do
    {
      stripeToken: SecureRandom.uuid,
      property_id: property.id,
      user_id: user.id,
      checkin_date: '10/31/2024',
      checkout_date: '11/04/2024',
      email: 'user.email',
      weekly_discount: '10',
      service_fee: '50.12',
      cleaning_fee: '60',
      total: '123.23'
    }
  end
  before do
    sign_in user
    allow(Stripe::Customer).to receive(:retrieve).and_return(double(id: 'user_id'))
    allow(Stripe::Customer).to receive(:create_source).and_return(double(id: 'card_id'))
    allow(Stripe::Charge).to receive(:create).and_return(double(id: 'chagre_id'))
  end
  describe 'Post create' do
    it 'it succeds in creating reservation' do
      expect do
        post reservation_payments_path, params: payment_params
      end.to change { Reservation.count }.by(1)
    end
    it 'it succeds payment' do
      expect do
        post reservation_payments_path, params: payment_params
      end.to change { Payment.count }.by(1)
    end
  end
end
