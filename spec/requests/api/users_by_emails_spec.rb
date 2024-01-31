require 'rails_helper'

RSpec.describe 'Api:UsersByEmails', type: :request do
  describe 'GET users show' do
    let(:headers) do
      { 'ACCEPT' => 'application/json' }
    end
    context 'user exist' do
      it 'is successful' do
        user = create(:user)
        get(api_users_by_email_path, params: { email: user.email }, headers:)
        expect(response).to be_successful
      end
    end
    context 'user does not exist' do
      it 'is not found' do
        get(api_users_by_email_path, params: { email: 'userspam@gmail.com' }, headers:)
        expect(response).to have_http_status(404)
      end
    end
  end
end
