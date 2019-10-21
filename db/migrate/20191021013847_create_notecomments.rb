class CreateNotecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :notecomments do |t|
      t.integer :note_id
      t.integer :user_id
      t.string :comment
      t.string :picture

      t.timestamps
    end
  end
end
