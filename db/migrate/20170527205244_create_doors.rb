class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.string :from_coords
      t.string :to_coords
      t.timestamps null: false
    end
  end
end
