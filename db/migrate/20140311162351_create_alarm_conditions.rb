class CreateAlarmConditions < ActiveRecord::Migration
  def change
    create_table :alarm_conditions do |t|
      t.string :command
      t.float :value
      t.string :comparator
      t.references :alarm, index: true

      t.timestamps
    end
  end
end
