require 'swagger_helper'

RSpec.describe 'api/teachers', type: :request do
    
  # index
  describe 'Teachers API' do

    path '/api/v1/teachers'  do
  
      get 'fetch data to the teachers table' do
          tags 'data from the teachers route'
          produces 'application/json', 'application/xml'
          response '200', 'List of data fetched' do 
              schema type: :array,
              properties: {
                id: { type: :integer },
                name: { type: :string },
                last_name: { type: :string },
                degree: { type: :string },
                created_at: { type: :datetime },
                updated_at: { type: :datetime },
              },
              required: [ 'name','last_name','degree' ]
              run_test!
            end
      end
    end
  #create

    path '/api/v1/teachers' do

      post 'Creates a teacher' do
        tags 'Teacher'
        consumes 'application/json'
        parameter name: :teacher_params, in: :body, schema: {
          type: :object,
          properties: {
           name: { type: :string },
           last_name: { type: :string },
           degree: { type: :string },
          },
          required: [ 'name', 'last_name', 'degree']
        }
  
        response '201', 'Teacher created' do
            
          let(:teacher_params) { {name: 'ddddddd', last_name: 'yyy', degree: 'course_id' } }
          run_test!
        end
  
        
  response '422', 'invalid request' do
    let(:teacher_params) { {  } }
    run_test!
  end

      end
    end

#show
path 'api/v1/teachers/{id}' do

get 'show a teacher' do
tags 'Teacher'
consumes 'application/json'
parameter name: :id, in: :path, schema: {
  type: :object,
  properties: {
  id: { type: :integer} ,
  },
  required: [ 'id' ]
}

response '200', 'Teacher founded founded' do
  let(:id) { Teacher.create(name: 'ar',last_name: 'aa', degree: 'degree').id }

  
  run_test!

end

end
end


#update
path '/api/v1/teachers/{id}' do

patch 'Updates the selected teacher' do
tags 'Teacher'
consumes 'application/json'
parameter name: :id, in: :path, type: :integer
parameter name: :teacher_params, in: :body, schema: {
  type: :object,
  properties: {
   name: { type: :string },
   last_name: { type: :string },
   degree: { type: :string },
  
  },
  required: [ 'last_name', 'name', 'degree' ]
}

response '200', 'Teacher updated' do
  let(:id) { Teacher.create(name: 'ar',last_name: 'aa', degree: 'degree').id }
  let(:teacher_params) { { name: 'jose',last_name: 'new',degree:'apol'} }
  run_test!
end
end
end
   
#delete
path 'api/v1/teachers/{id}' do
delete 'Delete a teacher' do
tags 'Teachers'
consumes 'application/json'
parameter name: :id, in: :path, type: :integer

response '204', 'Teacher deleted' do
  let(:id) { Teacher.create(name: 'ar',last_name: 'aa', degree: 'degree').id }
  run_test!
end
end
end
  end
  
end
