class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :area_name, unique: true
      t.string :area_name_katakana, unique: true
      t.string :area_name_alphabet, unique: true
      t.string :region
      t.string :prefecture
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
