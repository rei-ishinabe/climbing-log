class AddRouteIdToLogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :logs, :route, foreign_key: true
  end
end
