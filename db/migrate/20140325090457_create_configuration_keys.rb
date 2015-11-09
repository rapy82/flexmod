class CreateConfigurationKeys < ActiveRecord::Migration
  def change
    create_table :configuration_keys do |t|
      t.string :key
      t.string :value
      t.string :description
      t.string :section

      t.timestamps
    end
  end
end
