class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string :name
      t.text :message
      t.text :mails

      t.timestamps
    end
  end
end
