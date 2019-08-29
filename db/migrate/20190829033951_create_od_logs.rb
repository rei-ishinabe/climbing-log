class CreateOdLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :od_logs do |t|
      t.datetime :date
      t.string :comment
      t.references :status, foreign_key: true
      t.references :od_route, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
