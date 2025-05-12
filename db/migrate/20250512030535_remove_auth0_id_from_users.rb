class RemoveAuth0IdFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_index :users, :auth0_id
    remove_column :users, :auth0_id
  end
end
