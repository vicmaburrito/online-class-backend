class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :max_num_students
      t.integer :teacher_id
      t.timestamps
    end
  end
end
