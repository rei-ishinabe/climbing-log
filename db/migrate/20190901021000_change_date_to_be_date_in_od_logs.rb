class ChangeDateToBeDateInOdLogs < ActiveRecord::Migration[5.2]
  def change
    change_column :od_logs, :date, :date
  end
end
