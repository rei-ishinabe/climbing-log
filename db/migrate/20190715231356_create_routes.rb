class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :route_type
      t.string :image
      t.string :route_name
      t.string :comment
      t.references :category, foreign_key: true
      t.references :grade, foreign_key: true
      t.references :sub_grade, foreign_key: true
      t.references :user, foreign_key: true
      t.references :gym, foreign_key: true

      t.timestamps
    end
  end
end
