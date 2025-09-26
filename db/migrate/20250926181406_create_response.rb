class CreateResponse < ActiveRecord::Migration[8.0]
  def change
    create_table :responses do |t|
      t.string :text, null: false
      t.references :field, null: false, foreign_key: true
      t.references :log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
