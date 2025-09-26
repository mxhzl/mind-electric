class AddFormToLog < ActiveRecord::Migration[8.0]
  def change
   remove_column :logs, :trigger, :string
   remove_column :logs, :bad_thought, :string
   remove_column :logs, :emotion, :string
   remove_column :logs, :good_thought, :string
   add_reference :logs, :form, null: false, foreign_key: true
  end
end
