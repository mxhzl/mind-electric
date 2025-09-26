class CreateForms < ActiveRecord::Migration[8.0]
  def change
    create_table :forms do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: false
      t.index [ :name, :active ], unique: true

      t.timestamps
    end
  end
end
