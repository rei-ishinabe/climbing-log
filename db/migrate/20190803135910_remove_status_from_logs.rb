class RemoveStatusFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :status, :string
  end
end
