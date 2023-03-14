# This file should contain all the record creation needed to seed the database with its default values.
# data whiout foreign key
User.create(username: "jose",email: "emai@hotmail.com",password: '153624')
Teacher.create(name: "jose",last_name: "perez", degree: 'mastery')
City.create(city_name: "Mexico")

# data with foreign key
Course.create(name: "english", description: "english classes", max_num_students: 20,teacher_id: Teacher.first.id)
Course.create(name: "spanish", description: "spanish classes", max_num_students: 20,teacher_id: Teacher.first.id)
Course.create(name: "persian", description: "persian classes", max_num_students: 20,teacher_id: Teacher.first.id)
Course.create(name: "french", description: "french classes", max_num_students: 20,teacher_id: Teacher.first.id)


Schedule.create(day_of_week: Date.today,start_time: Time.now,duration: Time.now,course_id: Course.first.id)
Enrollment.create(sign_up_date: Date.today, course_id: Course.first.id,user_id: User.first.id, city_id: City.last.id)