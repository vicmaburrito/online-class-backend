class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :max_num_students
      t.string :picture
      t.integer :user_id # foreign key
      t.timestamps
    end
  end
end
