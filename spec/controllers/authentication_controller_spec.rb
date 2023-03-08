require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST #login' do
    context 'with valid email and password' do
      let!(:user) { create(:random_user) }

      before do
        post :login, params: { email: user.email, password: 'password' }
      end

      it 'returns a JWT token' do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to include(
          'token' => be_a(String),
          'exp' => be_a(String),
          'username' => user.username
        )
      end
    end

    context 'with invalid email or password' do
      before do
        post :login, params: { email: 'invalid@example.com', password: 'wrongpassword' }
      end

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to include(
          'errors' => 'Invalid email or password'
        )
      end
    end
  end
end
