class AddColumnToOdRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :od_routes, :route_type, :string
  end
end
