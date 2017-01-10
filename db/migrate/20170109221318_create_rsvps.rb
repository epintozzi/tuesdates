class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
