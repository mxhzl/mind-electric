class ChangeFieldsHelpTextNullConstraint < ActiveRecord::Migration[8.0]
  def change
    change_column_null :fields, :help_text, true
  end
end
