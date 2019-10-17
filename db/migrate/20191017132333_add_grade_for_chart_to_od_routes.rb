class AddGradeForChartToOdRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :od_routes, :grade_for_chart, :float
  end
end
