class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.date :date
      t.string :category
      t.string :route_type
      t.string :route_name
      t.string :grade
      t.string :sub_grade
      t.string :status
      t.string :comment
      t.string :image
      t.references :user, foreign_key: true
      t.references :gym, foreign_key: true

      t.timestamps
    end
  end
end
