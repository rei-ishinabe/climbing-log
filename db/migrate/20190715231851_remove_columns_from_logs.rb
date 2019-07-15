class RemoveColumnsFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :route_type, :string
    remove_column :logs, :route_name, :string
    remove_column :logs, :user_id, :bigint
    remove_column :logs, :gym_id, :bigint
    remove_column :logs, :category_id, :bigint
    remove_column :logs, :grade_id, :bigint
    remove_column :logs, :sub_grade_id, :bigint
  end
end
