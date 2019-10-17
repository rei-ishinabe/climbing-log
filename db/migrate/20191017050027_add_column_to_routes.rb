class AddColumnToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :grade_for_chart, :float
  end
end
