class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :first_name
      t.string :last_name
      t.string :image_url
      t.string :email
      
      t.timestamps
    end
  end
end
