class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.date :day_of_week
      t.datetime :start_time
      t.time :duration
      t.integer :course_id # foreign key
      t.timestamps
    end
  end
end
