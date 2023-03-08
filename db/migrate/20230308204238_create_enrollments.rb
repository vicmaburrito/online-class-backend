class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.date :sign_up_date
      t.class_id :integer
      t.user_id :integer
      t.country_id :integer
      t.timestamps
    end
  end
end
