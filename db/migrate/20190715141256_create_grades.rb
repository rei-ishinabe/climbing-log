class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :grade
      t.integer :order
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
