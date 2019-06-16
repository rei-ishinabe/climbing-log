class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :name_katakana
      t.string :name_alphabet
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
