require 'rails_helper'

RSpec.describe 'Api:Favroutes', type: :request do
  describe 'GET users show' do
    let(:headers) do
      { 'ACCEPT' => 'application/json' }
    end
    let(:user) { create(:user) }
    let(:property) { create(:property) }

    before { sign_in user }
    describe 'POST create' do
      let(:params) do
        {
          favroute: {
            user_id: user.id,
            property_id: property.id
          }
        }
      end
      it 'creates a new favroutes' do
        expect do
          post api_favroutes_path, params:, headers:
        end.to change(Favroute, :count).by(1)
        expect(response.status).to eq(201)
      end
    end
    describe 'DELETE destroy' do
      it 'deletes a favroute' do
        favroute = create(:favroute)
        expect do
          delete api_favroute_path(favroute), headers:
        end.to change(Favroute, :count).by(-1)

        expect(response.status).to eq(204)
      end
    end
  end
end
