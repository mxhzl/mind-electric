class AddUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :auth0_id, null: false

      t.timestamps
    end

    add_index :users, :auth0_id, unique: true
  end
end
