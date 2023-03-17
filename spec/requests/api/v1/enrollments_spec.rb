require 'swagger_helper'

RSpec.describe 'api/v1/enrollments', type: :request do
  before(:each) do
    @user = User.create(username: 'juan', email: 'email@hotmail.com', password: '153624')
    @city = City.create(city_name: 'Brasil')
    @course = Course.create(name: 'French', description: 'english classes', max_num_students: 20,
                            user_id: @user.id)
    @enrollment = Enrollment.create(sign_up_date: Date.today, course_id: @course.id, user_id: @user.id,
                                    city_id: @city.id)
    token = jwt_encode({ user_id: @user.id })
    headers = { 'Authorization' => "Bearer #{token}" }
    allow_any_instance_of(ActionDispatch::Request).to receive(:headers).and_return(headers)
  end

  # index
  describe 'Enrollments API' do
    path '/api/v1/enrollments' do
      get 'fetch data to the enrollments table' do
        tags 'data from the enrollments route'
        produces 'application/json', 'application/xml'
        response '200', 'List of data fetched' do
          schema type: :array,
                 properties: {
                   sign_up_date: { type: :date },
                   course_id: { type: :integer },
                   user_id: { type: :integer },
                   city_id: { type: :integer },
                   created_at: { type: :datetime },
                   updated_at: { type: :datetime }
                 }
          run_test!
        end
      end
    end
    # create

    path '/api/v1/enrollments' do
      post 'Creates a enrollments' do
        tags 'Enrollments'
        consumes 'application/json'
        parameter name: :enrollment_params, in: :body, schema: {
          type: :object,
          properties: {
            sign_up_date: { type: :date },
            course_id: { type: :integer },
            user_id: { type: :integer },
            city_id: { type: :integer }
          },
          required: %w[sign_up_date course_id user_id city_id]
        }

        response '201', 'Enrollment created' do
          let(:enrollment_params) do
            { sign_up_date: Date.today, course_id: @course.id, user_id: @user.id, city_id: @city.id }
          end
          run_test!
        end

        response '422', 'invalid request' do
          let(:enrollment_params) { {} }
          run_test!
        end
      end
    end

    # show
    path 'api/v1/enrollments/{id}' do
      get 'show an enrollment' do
        tags 'Enrollment'
        consumes 'application/json'
        parameter name: :id, in: :path, schema: {
          type: :object,
          properties: {
            id: { type: :integer },
            sign_up_date: { type: :date },
            course_id: { type: :integer },
            user_id: { type: :integer },
            city_id: { type: :integer }
          },
          required: ['id']
        }

        response '200', 'Enrollment founded ' do
          let(:id) { @enrollment.id }

          run_test!
        end
      end
    end

    # update
    path '/api/v1/enrollments/{id}' do
      patch 'Updates the selected Enrollment' do
        tags 'Enrollment'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer
        parameter name: :enrollment_params, in: :body, schema: {
          type: :object,
          properties: {
            id: { type: :integer },
            sign_up_date: { type: :date },
            course_id: { type: :integer },
            user_id: { type: :integer },
            city_id: { type: :integer }
          },
          required: %w[sign_up_date course_id user_id city_id]
        }

        response '200', 'Enrollment updated' do
          let(:id) { @enrollment.id }
          let(:enrollment_params) do
            { sign_up_date: Date.today, course_id: @course.id, user_id: @user.id, city_id: @city.id }
          end
          run_test!
        end
      end
    end

    # delete
    path 'api/v1/enrollments/{id}' do
      delete 'Delete a enrollment' do
        tags 'Enrollments'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer

        response '204', 'Enrollment deleted' do
          let(:id) { @enrollment.id }
          run_test!
        end
      end
    end
  end
end
