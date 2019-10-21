class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :grade
      t.integer :subject_id
      t.string :picture
      t.boolean :nameless
      t.boolean :solve

      t.timestamps
    end
  end
end
