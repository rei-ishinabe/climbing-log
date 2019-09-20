class RemoveColumnFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :privacy_setting, :string
    add_column :users, :privacy_setting, :integer, default: 0
  end
end
