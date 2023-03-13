require 'swagger_helper'

RSpec.describe 'api/v1/schedules', type: :request do
  before(:each) do
    @user = User.create(username: 'juan', email: 'email@hotmail.com', password: '153624')
    @city = City.create(city_name: 'Brasil')
    @teacher = Teacher.create(name: 'Carlos', last_name: 'perez', degree: 'mastery')
    @course = Course.create(name: 'French', description: 'english classes', max_num_students: 20,
                            teacher_id: @teacher.id)
    @schedule = Schedule.create(day_of_week: Date.today, start_time: Time.now, duration: Time.now,
                                course_id: @course.id)
    token = jwt_encode({ user_id: @user.id })
    headers = { 'Authorization' => "Bearer #{token}" }
    allow_any_instance_of(ActionDispatch::Request).to receive(:headers).and_return(headers)
  end

  # index
  describe 'Schedules API' do
    path '/api/v1/schedules' do
      get 'fetch data to the schedules table' do
        tags 'data from the schedules route'
        produces 'application/json', 'application/xml'
        response '200', 'List of data fetched' do
          schema type: :array,
                 properties: {
                   day_of_week: { type: :date },
                   start_time: { type: :time },
                   duration: { type: :time },
                   course_id: { type: :integer },
                   created_at: { type: :datetime },
                   updated_at: { type: :datetime }
                 }
          run_test!
        end
      end
    end
    # create

    path '/api/v1/schedules' do
      post 'Creates a squedule' do
        tags 'Schedule'
        consumes 'application/json'
        parameter name: :schedule_params, in: :body, schema: {
          type: :object,
          properties: {
            day_of_week: { type: :date },
            start_time: { type: :time },
            duration: { type: :time },
            course_id: { type: :integer }
          },
          required: %w[day_of_week start_time duration course_id]
        }


        response '201', 'Schedule created' do
          let(:schedule_params) do
            { day_of_week: Date.today, start_time: Time.now, duration: Time.now, course_id: @course.id }
          end
          run_test!
        end


        response '422', 'invalid request' do
          let(:schedule_params) { {} }
          run_test!
        end
      end
    end

    # show
    path 'api/v1/schedules/{id}' do
      get 'show a schedule' do
        tags 'Schedule'
        consumes 'application/json'
        parameter name: :id, in: :path, schema: {
          type: :object,
          properties: {
            day_of_week: { type: :date },
            start_time: { type: :time },
            duration: { type: :time },
            course_id: { type: :integer }
          },
          required: %w[day_of_week start_time duration course_id]
        }

        response '200', 'Schedule founded founded' do
          let(:id) { @schedule.id }

          run_test!
        end
      end
    end


    # update
    path '/api/v1/schedules/{id}' do
      patch 'Updates the selected Schedule' do
        tags 'Schedule'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer
        parameter name: :schedule_params, in: :body, schema: {
          type: :object,
          properties: {
            day_of_week: { type: :date },
            start_time: { type: :time },
            duration: { type: :time },
            course_id: { type: :integer }
          },
          required: %w[day_of_week start_time duration course_id]
        }

        response '200', 'Schedule updated' do
          teacher = Teacher.create(name: 'jose', last_name: 'zepeda', degree: 'degree')
          course = Course.create(name: 'english', description: 'english classes', max_num_students: 20,
                                 teacher_id: teacher.id)
          let(:id) do
            Schedule.create(day_of_week: Date.today, start_time: Time.now, duration: Time.now, course_id: course.id).id
          end
          let(:schedule_params) do
            { day_of_week: Date.today, start_time: Time.now, duration: Time.now, course_id: course.id }
          end
          run_test!
        end
      end
    end

    # delete
    path 'api/v1/schedules/{id}' do
      delete 'Delete a schedule' do
        tags 'Schedule'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer

        response '204', 'Schedule deleted' do
          let(:id) { @schedule.id }
          run_test!
        end
      end
    end
  end
end
