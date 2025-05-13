class ChangeLogsNullConstraint < ActiveRecord::Migration[8.0]
  def change
    change_column_null(:logs, :date, false)
    change_column_null(:logs, :trigger, false)
    change_column_null(:logs, :bad_thought, false)
    change_column_null(:logs, :emotion, false)
    change_column_null(:logs, :good_thought, false)
  end
end
