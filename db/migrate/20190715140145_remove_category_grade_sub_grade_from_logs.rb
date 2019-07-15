class RemoveCategoryGradeSubGradeFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :category, :string
    remove_column :logs, :grade, :string
    remove_column :logs, :sub_grade, :string
  end
end
