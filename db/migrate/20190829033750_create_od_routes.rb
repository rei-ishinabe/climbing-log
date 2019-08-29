class CreateOdRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :od_routes do |t|
      t.string :route_name
      t.string :route_name_katakana
      t.string :route_name_alphabet
      t.references :grade, foreign_key: true
      t.references :sub_grade, foreign_key: true
      t.references :sub_area, foreign_key: true

      t.timestamps
    end
  end
end
