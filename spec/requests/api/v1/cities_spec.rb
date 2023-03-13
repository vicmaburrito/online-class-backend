require 'swagger_helper'

RSpec.describe 'api/cities', type: :request do
  before(:each) do
    @user = User.create(username: 'juan', email: 'email@hotmail.com', password: '153624')
    @city = City.create(city_name: 'Brasil')
    token = jwt_encode({ user_id: @user.id })
    headers = { 'Authorization' => "Bearer #{token}" }
    allow_any_instance_of(ActionDispatch::Request).to receive(:headers).and_return(headers)
  end

  # index
  describe 'City API' do
    path '/api/v1/cities' do
      get 'fetch data to the citites table' do
        tags 'data from the cities page'
        produces 'application/json', 'application/xml'
        response '200', 'List of data fetched' do
          schema type: :array,
                 properties: {
                   id: { type: :integer },
                   country_name: { type: :string },
                   created_at: { type: :datetime },
                   updated_at: { type: :datetime }
                 }
          run_test!
        end
      end
    end
    # create

    path '/api/v1/cities' do
      post 'Creates a city' do
        tags 'Cities'
        consumes 'application/json'
        parameter name: :city_params, in: :body, schema: {
          type: :object,
          properties: {
            city_name: { type: :string },
            created_at: { type: :datetime },
            updated_at: { type: :datetime }

          },
          required: ['city_name']
        }

        response '201', 'city created' do
          let(:city_params) { { city_name: 'foo' } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:city_params) { {} }
          run_test!
        end
      end
    end

    # show
    path 'api/v1/cities/{id}' do
      get 'show a city' do
        tags 'Cities'
        consumes 'application/json'
        parameter name: :id, in: :path, schema: {
          type: :object,
          properties: {
            id: { type: :integer }
          },
          required: ['id']
        }

        response '200', 'City founded' do
          let(:id) { @city.id }

          run_test!
        end
      end
    end

    # update
    path '/api/v1/cities/{id}' do
      patch 'Updates the selected city' do
        tags 'Cities'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer
        parameter name: :city_params, in: :body, schema: {
          type: :object,
          properties: {
            city_name: { type: :string }

          },
          required: ['city_name']
        }

        response '200', 'city updated' do
          let(:id) { @city.id }
          let(:city_params) { { city_name: 'new' } }
          run_test!
        end
      end
    end

    # delete
    path 'api/v1/cities/{id}' do
      delete 'Delete a city' do
        tags 'Cities'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer

        response '204', 'City deleted' do
          let(:id) { @city.id }
          run_test!
        end
      end
    end
  end
end
