require 'rails_helper'

RSpec.describe 'Passwords', type: :request do
  let(:user) { create(:user) }
  let(:payments) { create_list(:payments) }
  before { sign_in user }

  describe 'GET show' do
    it 'succeeds' do
      get payments_path
      expect(response).to be_successful
    end
  end
end
