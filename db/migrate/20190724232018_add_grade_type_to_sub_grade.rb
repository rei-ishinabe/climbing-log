class AddGradeTypeToSubGrade < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_grades, :grade_type, :string
  end
end
