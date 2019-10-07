class AddIndexToUsersHashString < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :hash_string
  end
end
