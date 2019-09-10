class AddCategoryIdToOdRoutes < ActiveRecord::Migration[5.2]
  def change
    add_reference :od_routes, :category, foreign_key: true
  end
end
