require 'swagger_helper'

RSpec.describe 'api/cities', type: :request do

  # index
    describe 'City API' do

        path '/api/v1/cities'  do
      
          get 'fetch data to the citites table' do
              tags 'data from the cities page'
              produces 'application/json', 'application/xml'
              response '200', 'List of data fetched' do 
                  schema type: :array,
                  properties: {
                    id: { type: :integer },
                    country_name: { type: :string },
                    created_at: { type: :datetime },
                    updated_at: { type: :datetime },
                  }
                  run_test!
                end
          end
        end
      #create

        path '/api/v1/cities' do

          post 'Creates a city' do
            tags 'Cities'
            consumes 'application/json'
            parameter name: :city_params, in: :body, schema: {
              type: :object,
              properties: {
               city_name: { type: :string },
              
              },
              required: [ 'city_name' ]
            }
      
            response '201', 'city created' do
              let(:schedule_params) { { city_name: 'foo' } }
              run_test!
            end
      
            
      response '422', 'invalid request' do
        let(:schedule_params) { {  } }
        run_test!
      end

          end
        end

#show
path 'api/v1/cities/{id}' do

  get 'show a city' do
    tags 'Cities'
    consumes 'application/json'
    parameter name: :id, in: :path, schema: {
      type: :object,
      properties: {
      id: { type: :integer} ,
      },
      required: [ 'id' ]
    }

    response '200', 'City founded' do
      let(:id) { City.create(city_name: 'ar').id }

      
      run_test!

    end

  end
end


#update
path '/api/v1/cities/{id}' do

  patch 'Updates the selected city' do
    tags 'Cities'
    consumes 'application/json'
    parameter name: :id, in: :path, type: :integer
    parameter name: :city_params, in: :body, schema: {
      type: :object,
      properties: {
       city_name: { type: :string },
      
      },
      required: [ 'city_name' ]
    }

    response '200', 'city updated' do
      let(:id) { City.create(city_name: 'ar').id }
      let(:city_params) { { city_name: 'new' } }
      run_test!
    end
  end
end
       
#delete
path 'api/v1/cities/{id}' do
  delete 'Delete a city' do
    tags 'Cities'
    consumes 'application/json'
    parameter name: :id, in: :path, type: :integer
  
    response '204', 'City deleted' do
      let(:id) { City.create(city_name: 'ar').id }
      run_test!
    end
  end
end
      end
      
end
