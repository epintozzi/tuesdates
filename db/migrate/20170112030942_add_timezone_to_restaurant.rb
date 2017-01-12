class AddTimezoneToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :timezone_name, :text
  end
end
