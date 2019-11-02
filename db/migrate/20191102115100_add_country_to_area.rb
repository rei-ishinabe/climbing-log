class AddCountryToArea < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :country, :string
  end
end
