class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :classroom_id
      t.string :userid
      t.string :name
      t.string :icon
      t.string :introduce
      t.string :password
      t.boolean :release

      t.timestamps
    end
  end
end
