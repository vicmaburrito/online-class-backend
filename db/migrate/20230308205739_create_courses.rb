class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :max_num_students
      t.string :picture, default: "http://theindianite.weebly.com/uploads/4/3/3/7/43376815/college-classes_1_orig.jpg"
      t.integer :teacher_id # foreign key
      t.timestamps
    end
  end
end
