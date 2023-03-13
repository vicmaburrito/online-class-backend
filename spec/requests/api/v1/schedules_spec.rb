require 'swagger_helper'

RSpec.describe 'api/v1/schedules', type: :request do
 # index
 describe 'Schedules API' do

    path '/api/v1/schedules'  do
  
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
              }
              run_test!
            end
      end
    end
  #create

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
            course_id: { type: :integer },  
          },
          required: [ 'day_of_week', 'start_time', 'duration','course_id' ]
        }
        
  
        response '201', 'Schedule created' do
          teacher = Teacher.create(name: 'jose',last_name: 'zepeda', degree: 'degree')
          course = Course.create(name: "english", description: "english classes", max_num_students: 20,teacher_id: teacher.id)
          let(:schedule_params) { {day_of_week: Date.today,start_time: Time.now,duration: Time.now,course_id: course.id} }
          run_test!
        end
  
        
  response '422', 'invalid request' do
    let(:schedule_params) { {  } }
    run_test!
  end

      end
    end

#show
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
    course_id: { type: :integer },  
  },
  required: [ 'day_of_week', 'start_time', 'duration','course_id' ]
}

response '200', 'Schedule founded founded' do
  teacher = Teacher.create(name: 'jose',last_name: 'zepeda', degree: 'degree')
  course = Course.create(name: "english", description: "english classes", max_num_students: 20,teacher_id: teacher.id)
let(:id) { Schedule.create(day_of_week: Date.today,start_time: Time.now,duration: Time.now,course_id: course.id).id } 
  
  run_test!

end

end
end


#update
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
    course_id: { type: :integer },  
  },
  required: [ 'day_of_week', 'start_time', 'duration','course_id' ]
}

response '200', 'Schedule updated' do
    teacher = Teacher.create(name: 'jose',last_name: 'zepeda', degree: 'degree')
    course = Course.create(name: "english", description: "english classes", max_num_students: 20,teacher_id: teacher.id)
  let(:id) { Schedule.create(day_of_week: Date.today,start_time: Time.now,duration: Time.now,course_id: course.id).id }
  let(:schedule_params) { {day_of_week: Date.today,start_time: Time.now,duration: Time.now,course_id: course.id} }
  run_test!
end
end
end
   
#delete
path 'api/v1/schedules/{id}' do
delete 'Delete a schedule' do
tags 'Schedule'
consumes 'application/json'
parameter name: :id, in: :path, type: :integer

response '204', 'Schedule deleted' do
    teacher = Teacher.create(name: 'jose',last_name: 'zepeda', degree: 'degree')
    course = Course.create(name: "english", description: "english classes", max_num_students: 20,teacher_id: Teacher.first.id)
    let(:id) { Schedule.create(day_of_week: Date.today,start_time: Time.now,duration: Time.now,course_id: course.id).id }
  run_test!
end
end
end
  end
  
end
