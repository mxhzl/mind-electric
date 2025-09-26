class ChangeFieldsKeyNullConstraint < ActiveRecord::Migration[8.0]
  def change
    change_column_null :fields, :key, false
  end
end
