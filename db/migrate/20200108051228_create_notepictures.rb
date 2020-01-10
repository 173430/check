class CreateNotepictures < ActiveRecord::Migration[5.2]
  def change
    create_table :notepictures do |t|
      t.integer :note_id
      t.string :picture
      t.integer :disp_order

      t.timestamps
    end
  end
end
