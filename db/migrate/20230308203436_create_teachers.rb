class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :last_name
      t.string :degree

      t.timestamps
    end
  end
end
