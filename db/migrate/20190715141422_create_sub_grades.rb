class CreateSubGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_grades do |t|
      t.string :sub_grade
      t.string :order
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
