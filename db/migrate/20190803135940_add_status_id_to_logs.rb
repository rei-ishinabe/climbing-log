class AddStatusIdToLogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :logs, :status, foreign_key: true
  end
end
