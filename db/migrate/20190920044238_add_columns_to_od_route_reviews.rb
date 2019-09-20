class AddColumnsToOdRouteReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :od_route_reviews, :privacy_setting, :integer, default: 0
    add_column :od_route_reviews, :image, :string
  end
end
