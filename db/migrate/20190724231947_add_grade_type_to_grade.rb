class AddGradeTypeToGrade < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :grade_type, :string
  end
end
