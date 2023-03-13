require 'swagger_helper'

RSpec.describe 'api/v1/courses', type: :request do
  before(:each) do
    @user = User.create(username: 'juan', email: 'email@hotmail.com', password: '153624')
    @teacher = Teacher.create(name: 'Carlos', last_name: 'perez', degree: 'mastery')
    @course = Course.create(name: 'French', description: 'english classes', max_num_students: 20,
                            teacher_id: @teacher.id)
    token = jwt_encode({ user_id: @user.id })
    headers = { 'Authorization' => "Bearer #{token}" }
    allow_any_instance_of(ActionDispatch::Request).to receive(:headers).and_return(headers)
  end
  # index
  describe 'Courses API' do
    path '/api/v1/courses' do
      get 'fetch data to the courses table' do
        tags 'data from the courses route'
        produces 'application/json', 'application/xml'
        response '200', 'List of data fetched' do
          schema type: :array,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string },
                   max_num_students: { type: :integer },
                   teacher_id: { type: :integer },
                   created_at: { type: :datetime },
                   updated_at: { type: :datetime }
                 }
          run_test!
        end
      end
    end
    # create

    path '/api/v1/courses' do
      post 'Creates a course' do
        tags 'Course'
        consumes 'application/json'
        parameter name: :course_params, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            max_num_students: { type: :integer },
            teacher_id: { type: :integer }
          },
          required: ['name', 'description', 'teacher_id, max_num_students']
        }

        response '201', 'Course created' do
          let(:course_params) do
            { name: 'emanuel', description: 'from another country', max_num_students: 10, teacher_id: @teacher.id }
          end
          run_test!
        end


        response '422', 'invalid request' do
          let(:course_params) { {} }
          run_test!
        end
      end
    end

    # show
    path 'api/v1/courses/{id}' do
      get 'show a course' do
        tags 'Teacher'
        consumes 'application/json'
        parameter name: :id, in: :path, schema: {
          type: :object,
          properties: {
            id: { type: :integer }
          },
          required: ['id']
        }

        response '200', 'Course founded founded' do
          let(:id) { @course.id }


          run_test!
        end
      end
    end

    # update
    path '/api/v1/courses/{id}' do
      patch 'Updates the selected Course' do
        tags 'Course'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer
        parameter name: :course_params, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            max_num_students: { type: :integer }

          },
          required: %w[name description max_num_students]
        }

        response '200', 'Course updated' do
          let(:id) { @course.id }
          let(:course_params) do
            { name: 'emanuel', description: 'frmo puebla', max_num_students: 10, teacher_id: @teacher.id }
          end
          run_test!
        end
      end
    end

    # delete
    path 'api/v1/courses/{id}' do
      delete 'Delete a course' do
        tags 'Courses'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer

        response '204', 'Course deleted' do
          let(:id) { @course.id }
          run_test!
        end
      end
    end
  end
end
