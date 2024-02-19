require 'rails_helper'

RSpec.describe 'Host::Dashboard', type: :request do
  let(:user) { create(:user, role: 'host') }
  before { sign_in user }
  describe 'PUT update' do
    context 'with valid role' do
      it 'turns to the user into a host' do
        get host_dashboard_path
        expect(response).to be_successful
      end
    end
    context 'without valid role' do
      it 'fails' do
        expect do
          user.update! role: nil
          get host_dashboard_path
        end.to raise_exception(Pundit::NotAuthorizedError)
      end
    end
  end
end
