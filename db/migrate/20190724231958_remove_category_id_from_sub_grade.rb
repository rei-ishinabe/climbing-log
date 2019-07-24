class RemoveCategoryIdFromSubGrade < ActiveRecord::Migration[5.2]
  def change
    remove_column :sub_grades, :category_id, :bigint
  end
end
