class CreateMaps < ActiveRecord::Migration[4.2]
  def change
    create_table :maps do |t|
      t.integer :current_room_id
      t.timestamps null: false
    end
  end
end
