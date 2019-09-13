class AddPrivacySettingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :privacy_setting, :string, default: 0
  end
end
