class CreateLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :logs do |t|
      t.date :date
      t.string :trigger
      t.string :bad_thought
      t.string :emotion
      t.string :good_thought

      t.timestamps
    end
  end
end
