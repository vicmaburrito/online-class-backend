class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.date :sign_up_date

      t.timestamps
    end
  end
end
