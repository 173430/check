class AddColumnNotepicture < ActiveRecord::Migration[5.2]
  def change

    add_column :notepictures, :cover, :string

  end
end
