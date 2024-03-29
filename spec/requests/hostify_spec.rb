require 'rails_helper'

RSpec.describe 'Hostify', type: :request do
  let(:user) { create(:user) }
  before { sign_in user }
  describe 'PUT update' do
    it 'turns to the user into a host' do
      put hostify_path(user_id: user.id)
      user.reload
      expect(user.role).to eq('host')
    end
  end
end
