class CreateDoors < ActiveRecord::Migration[5.1]
  def change
    create_table :doors do |t|
      t.string :from_coords
      t.string :to_coords
      t.timestamps null: false
    end
  end
end
