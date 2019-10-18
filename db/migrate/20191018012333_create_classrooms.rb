class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.integer :grade
      t.string :class

      t.timestamps
    end
  end
end
