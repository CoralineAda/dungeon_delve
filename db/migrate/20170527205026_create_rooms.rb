class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.text :description
      t.string :coords
      t.boolean :is_dark, default: false
      t.integer :map_id
      t.timestamps null: false
    end
  end
end
