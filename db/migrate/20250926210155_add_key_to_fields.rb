class AddKeyToFields < ActiveRecord::Migration[8.0]
  def change
    add_column :fields, :key, :string
    add_index :fields, :key, unique: true
  end
end
