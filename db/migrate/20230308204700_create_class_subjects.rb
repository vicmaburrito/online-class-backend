class CreateClassSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :class_subjects do |t|
      t.string :name
      t.string :description
      t.integer :max_num_students
      t.teacher_id :integer
      t.timestamps
    end
  end
end
