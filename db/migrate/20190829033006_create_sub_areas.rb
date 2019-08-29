class CreateSubAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_areas do |t|
      t.string :sub_area_name
      t.string :sub_area_name_katakana
      t.string :sub_area_name_alphabet
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
