require 'rails_helper'

RSpec.describe 'Host::Properties', type: :request do
  let(:user) { create(:user, role: 'host') }
  let(:property) { create(:property, user:) }
  before { sign_in user }
  describe 'GET new' do
    it 'succeeds' do
      get new_host_property_path
      expect(response).to be_successful
    end
  end
  describe 'POST create' do
    context 'valid params' do
      it 'succeeds and create a new property' do
        expect do
          post host_properties_path, params: {
            property: {
              name: 'new property name',
              headline: 'headline',
              description: 'description',
              city: 'Lisboa',
              state: 'LB',
              address1: 'Rua Timor Basto',
              address2: 'LS',
              zip_code: '2620',
              country_code: 'PT'
            }

          }
        end.to change { Property.count }.by(1)
        expect(response).to be_redirect
      end
    end
    context 'invalid params' do
      it 'fails and does not create a new property' do
        expect do
          post host_properties_path, params: {
            property: {
              name: 'new property name',
              headline: 'headline',
              description: 'description'
            }

          }
        end.not_to(change { Property.count })
        expect(response).to be_successful
      end
    end
  end
end
