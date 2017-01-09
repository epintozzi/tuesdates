class RemoveNullFromUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :provider, true
    change_column_null :users, :uid, true
  end
end
