class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.string :user_id
      t.boolean :release

      t.timestamps
    end
  end
end
