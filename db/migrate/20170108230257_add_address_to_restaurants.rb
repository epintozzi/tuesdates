class AddAddressToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :street, :text
    add_column :restaurants, :city, :text
    add_column :restaurants, :state, :text
    add_column :restaurants, :zip, :text
  end
end
