require 'swagger_helper'

RSpec.describe 'api/cities', type: :request do

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
                  },
                  required: [ 'id','country_name' ]
                  run_test!
                end
          end
        end
      
      end
      
end
