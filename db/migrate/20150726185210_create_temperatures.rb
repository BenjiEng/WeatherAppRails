class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.integer :temp
      t.string :location
      t.timestamps null: false
    end
  end
end
