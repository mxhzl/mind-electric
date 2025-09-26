class CreateFields < ActiveRecord::Migration[8.0]
  def change
    create_table :fields do |t|
      t.string :prompt, null: false
      t.string :help_text, null: false

      t.timestamps
    end

    create_join_table :fields, :forms do |t|
      t.index :field_id
      t.index :form_id
    end
  end
end
