class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.text :yelp_id
      t.text :name

      t.timestamps
    end
  end
end
