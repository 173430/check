class ChangeColumnClassroom < ActiveRecord::Migration[5.2]
  def change
    rename_column :classrooms, :class, :classname
  end
end
