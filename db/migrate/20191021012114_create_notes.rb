class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.string :title
      t.string :picture
      t.string :coverpicture
      t.integer :grade_id
      t.integer :subject_id
      t.string :extra
      t.integer :good
      t.boolean :release

      t.timestamps
    end
  end
end
