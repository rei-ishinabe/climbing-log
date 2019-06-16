class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :nickname, :string
    add_column :users, :image, :string
    add_column :users, :is_public, :boolean, default: false
  end
end
