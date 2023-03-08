class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.date :sign_up_date
      t.integer :course_id # foreign key
      t.integer :user_id # foreign key
      t.integer :city_id # foreign key
      t.timestamps
    end
  end
end
