class RemoveCategoryIdFromGrade < ActiveRecord::Migration[5.2]
  def change
    remove_column :grades, :category_id, :bigint
  end
end
