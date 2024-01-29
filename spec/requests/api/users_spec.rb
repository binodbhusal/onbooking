require 'rails_helper'

RSpec.describe 'Api: Users', type: :request do
  describe 'GET users show' do
    let(:headers) do
      { 'ACCEPT' => 'application/json' }
    end
    context 'user exist' do
      it 'is successful' do
        user = create(:user)
        get(api_user_path(user), headers:)
        expect(response).to be_successful
      end
    end
    context 'user does not exist' do
      it 'is not found' do
        get(api_user_path(id: 'userspam'), headers:)
        expect(response).to have_http_status(404)
      end
    end
  end
end
