class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.integer :current_room_id
      t.timestamps null: false
    end
  end
end
