class CreateOdRouteReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :od_route_reviews do |t|
      t.string :comment
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :od_route, foreign_key: true

      t.timestamps
    end
  end
end
