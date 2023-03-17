require 'rails_helper'
require 'faker'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST #login' do
    let(:user) do
      User.create!(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
    end

    context 'with valid email and password' do
      it 'returns a JWT token' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid email or password' do
      before do
        post :login, params: { email: 'invalid@example.com', password: 'wrongpassword' }
      end

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
