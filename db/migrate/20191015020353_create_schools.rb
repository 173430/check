class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :schoolname

      t.timestamps
    end
  end
end
