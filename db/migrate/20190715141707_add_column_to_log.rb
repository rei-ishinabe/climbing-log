class AddColumnToLog < ActiveRecord::Migration[5.2]
  def change
    add_reference :logs, :category, foreign_key: true
    add_reference :logs, :grade, foreign_key: true
    add_reference :logs, :sub_grade, foreign_key: true
  end
end
