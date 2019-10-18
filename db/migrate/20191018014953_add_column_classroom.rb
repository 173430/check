class AddColumnClassroom < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :department, :string
  end
end
