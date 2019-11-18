class ChangeColumnQuestion < ActiveRecord::Migration[5.2]
  def change

    rename_column :questions, :grade, :grade_id

  end
end
