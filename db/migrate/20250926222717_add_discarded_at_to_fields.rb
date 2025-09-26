class AddDiscardedAtToFields < ActiveRecord::Migration[8.0]
  def change
    add_column :fields, :discarded_at, :datetime
    add_index :fields, :discarded_at
  end
end
