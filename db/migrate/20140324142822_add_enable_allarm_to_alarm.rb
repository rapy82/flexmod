class AddEnableAllarmToAlarm < ActiveRecord::Migration
  def change
    add_column :alarms, :enabled, :boolean
    add_column :alarms, :suspended, :boolean
  end
end
